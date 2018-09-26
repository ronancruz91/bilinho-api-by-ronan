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
	end
end
