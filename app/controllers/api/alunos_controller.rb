module Api
	class AlunosController < ApplicationController
		def index
			alunos = Aluno.order('created_at DESC');
			render json: {
					status: 'Sucesso',
					message: 'Alunos carregados',
					data: alunos
				}, status: :ok
		end

		def create
			aluno = Aluno.new(aluno_params)
			if aluno.save
				render json: {
                                                status: 'Sucesso',
                                                message: 'Aluno salvo',
                                                data: aluno
                                        }, status: :ok
                        else
                                render json: {
                                                status: 'Erro',
                                                message: 'Aluno não salvo'
                                        }, status: :bad_request
                        end
		end

		private
		def aluno_params
			params.permit(:nome, :cpf, :data_nascimento,
					:telefone, :genero, :meio_pagamento)
		end
	end
end
