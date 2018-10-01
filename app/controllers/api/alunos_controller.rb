module Api
	class AlunosController < ApplicationController
		# listar todos os alunos cadastrados a partir de uma requisição GET
		def index
			alunos = Aluno.order('created_at DESC');
			render ResponseHelper.new({
					status: 'Sucesso',
					message: 'Alunos carregados',
					data: alunos
					}).success
		end

		# cria um novo aluno a partir de uma requisição POST
		def create
			begin
				aluno = Aluno.new(aluno_params)
				aluno.save!
			rescue ActiveRecord::ActiveRecordError => invalid
                        	render ResponseHelper.new({
						status: 'Erro',
                                        	message: invalid.record.errors
                                        	}).bad_request
			else
				render ResponseHelper.new({
					status: 'Sucesso',
                                        message: 'Aluno salvo',
                                        data: aluno
                                        }).success
			end
		end

		private
		def aluno_params
			params.permit(:nome, :cpf, :data_nascimento,
					:telefone, :genero, :meio_pagamento)
		end
	end
end
