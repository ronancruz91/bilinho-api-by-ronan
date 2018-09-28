class CreateFaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :faturas do |t|
      t.decimal :valor
      t.date :data_vencimento
      t.text :status, default: "Aberta"

      t.timestamps
    end
  end
end
