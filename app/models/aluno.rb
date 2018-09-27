class Aluno < ApplicationRecord
	validates :nome, presence: true, uniqueness: true
	validates :cpf, presence: true, uniqueness: true, format: { with: /[0-9]/,
                                                message: "Apenas números são permitidos" }
	validates :genero, presence: true, format: { with: /M|F/,
						message: "Gênero inválido" }
	validates :meio_pagamento, presence: true, format: { with: /Boleto|Cartão/,
                                                message: "Meio de pagamento inválido" }
	has_many :matriculas
end
