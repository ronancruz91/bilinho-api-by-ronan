module Api
        class MatriculasController < ApplicationController
		# Lista todas as matrículas a partir de uma requisição GET
                def index
                        matriculas = Matricula.order('created_at DESC');
                        render ResponseHelper.new({
                                        status: 'Sucesso',
                                        message: 'Matriculas carregadas',
                                        data: matriculas
                                        }).success
                end

		# Cria uma nova matrícula com suas respectivas faturas a partir de uma requisição POST
                def create
                        begin
                                matricula = Matricula.new(matricula_params)
                                result = matricula.save!
                        rescue ActiveRecord::ActiveRecordError => invalid
                                render ResponseHelper.new({
                                                status: 'Erro',
                                                message: invalid.record.errors
                                                }).bad_request
                        else
				faturas = gerar_faturas(matricula)
                                render ResponseHelper.new({
                                        status: 'Sucesso',
                                        message: 'Matrícula salva',
                                        data: { matricula: matricula, faturas: faturas}
                                        }).success
                        end
                end

                private
                def matricula_params
                        params.permit(:valor_total, :quantidade_faturas, :dia_vencimento_faturas,
                                :nome_curso, :instituicao_id, :aluno_id)
                end

		# Gera as faturas a partir das informações da matrícula
                def gerar_faturas(matricula)
                        valor_total = (matricula[:valor_total].to_f * 100).to_i
                        quantidade_faturas = matricula[:quantidade_faturas].to_i
                        resto = valor_total % quantidade_faturas
                        valor_fatura = valor_total / quantidade_faturas
                        faturas = Array.new(quantidade_faturas, valor_fatura)
			# Caso divisão do valor das faturas não sejam iguais, a diferença é divida entre elas
			if resto != 0
                        	i = 0
                        	resto.times do
                                	if i == quantidade_faturas
                                        	i = 0
                                	end
                                	faturas[i] = faturas[i] + 1
                                	i += 1
				end
                        end
			dia_vencimento_faturas = matricula[:dia_vencimento_faturas].to_i
			data_vencimento = get_primeira_data_vencimento(dia_vencimento_faturas)
                        faturas_geradas = []
			quantidade_faturas.times do |k|
                                valor = faturas[k].to_f / 100
                                fatura = Fatura.new({valor: valor, data_vencimento: data_vencimento, matricula_id: matricula[:id]})
                                fatura.save
                                faturas_geradas.push(fatura)
				data_vencimento = data_vencimento.next_month
			end
                        return faturas_geradas
                end

		# Define a primeira data de vencimento das faturas
		def get_primeira_data_vencimento(dia_vencimento_fatura)
			hoje = Date.today
                        if dia_vencimento_fatura <= hoje.mday
                                hoje = hoje.next_month
                        end
                        return Date.new(hoje.year, hoje.month, dia_vencimento_fatura)
		end
	end
end
