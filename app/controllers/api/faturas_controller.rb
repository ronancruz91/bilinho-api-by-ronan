module Api
	class FaturasController < ApplicationController
		# Lista todas as faturas a partir do ID de uma matrícula
		def index
			faturas = Fatura.where(["matricula_id = ?", params[:matricula_id].to_i])
			render ResponseHelper.new({
						status: 'Sucesso',
						message: 'Faturas encontradas',
						data: faturas
						}).success
		end
	end
end
