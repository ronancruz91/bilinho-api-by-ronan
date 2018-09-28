class Fatura < ApplicationRecord
        validates :valor, presence: true
        validates :data_vencimento, presence: true
        validates :status, presence: true, format: { with: /Aberta|Atrasada|Paga|/ }
        belongs_to :matricula
end
