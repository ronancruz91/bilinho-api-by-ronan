module Api
	class InstituicoesController < ApplicationController
		# Lista todas as instituições a partir de uma requisição GET
		def index
			instituicoes = Instituicao.order('created_at DESC');
			render ResponseHelper.new({
						status: 'Sucesso',
						message: 'Instituições carregadas',
						data: instituicoes
						}).success
		end

		# cria uma nova instituição a partir de uma requisição POST
		def create
			begin
				instituicao = Instituicao.new(instituicao_params)
				instituicao.save!
			rescue ActiveRecord::ActiveRecordError => invalid
                                render ResponseHelper.new({
                                                status: 'Erro',
                                                message: invalid.record.errors
                                                }).bad_request
                        else
				render ResponseHelper.new({
							status: 'Sucesso',
							message: 'Instituição salva',
							data: instituicao
							}).success
			end
		end

		private
		def instituicao_params
			params.permit(:nome, :cnpj, :tipo)
		end
	end
end
