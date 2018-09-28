class Matricula < ApplicationRecord
	validates :valor_total, presence: true, numericality: { greater_than: 0 }
	validates :quantidade_faturas, presence: true, numericality: {
							only_integer: true,
							greater_than_or_equal_to: 1 }
	validates :dia_vencimento_faturas, presence: true, numericality: {
                                                        only_integer: true,
                                                        greater_than_or_equal_to: 1,
                                                        less_than_or_equal_to: 31 }
	validates :nome_curso, presence: true
	belongs_to :aluno
	belongs_to :instituicao
	has_many :faturas
end
