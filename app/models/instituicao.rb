class Instituicao < ApplicationRecord
	validates :nome, presence: true, uniqueness: true
	validates :cnpj, presence: true, uniqueness: true, format: { with: /[0-9]/,
						message: "Apenas números são permitidos" }
	validates :tipo, presence: true, format: { with: /Universidade|Escola|Creche/,
                                                message: "Tipo inválido" }
	has_many :matriculas
end
