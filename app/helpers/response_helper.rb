class ResponseHelper
	def initialize(params)
		@status = params[:status]
		@message = params[:message]
		@data = params[:data]
	end

	def success
		return { json: {
				status: @status,
				mensagem: @message,
				dados: @data
			}, status: :ok }
	end

	def bad_request
		return { json: {
                                status: @status,
                                mensagem: @message
                        }, status: :bad_request }
	end
end
