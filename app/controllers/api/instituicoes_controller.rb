module Api
	class InstituicoesController < ApplicationController
		def index
			instituicoes = Instituicao.order('created_at DESC');
			render json: {
					status: 'Sucesso',
					message: 'Instituições carregadas',
					data: instituicoes
				}, status: :ok
		end

		def create
			instituicao = Instituicao.new(instituicao_params)
			if instituicao.save
				render json: {
						status: 'Sucesso',
						message: 'Instituição salva',
						data: instituicao
					}, status: :ok
			else
				render json: {
                                                status: 'Erro',
                                                message: 'Instituição não salva'
                                        }, status: :bad_request
			end
		end

		private
		def instituicao_params
			params.permit(:nome, :cnpj, :tipo)
		end
	end
end
