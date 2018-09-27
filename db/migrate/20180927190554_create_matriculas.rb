class CreateMatriculas < ActiveRecord::Migration[5.2]
  def change
    create_table :matriculas do |t|
      t.decimal :valor_total
      t.integer :quantidade_faturas
      t.integer :dia_vencimento_faturas
      t.text :nome_curso
      t.integer :aluno_id
      t.integer :instituicao_id

      t.timestamps
    end
  end
end
