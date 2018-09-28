module Api
	class MatriculasController < ApplicationController

		def index
			matriculas = Matricula.joins(:aluno);
			render json: {
                                        status: 'Sucesso',
                                        message: 'Matriculas carregadas',
                                        data: matriculas
                                }, status: :ok
		end

		def create
			matricula = Matricula.new(matricula_params)
			result = matricula.save
			render json: {
					data: result
				}, status: :ok
		end
		
		private
		def matricula_params
			params.permit(:valor_total, :quantidade_faturas, :dia_vencimento_faturas,
				:nome_curso, :instituicao_id, :aluno_id)
		end
	end
end
