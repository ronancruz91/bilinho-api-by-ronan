class Instituicao < ApplicationRecord
	validates :nome, presence: true
	validates :cnpj, presence: true
	validates :tipo, presence: true
end
