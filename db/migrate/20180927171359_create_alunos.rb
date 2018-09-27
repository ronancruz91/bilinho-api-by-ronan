class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.text :nome
      t.text :cpf
      t.date :data_nascimento
      t.integer :telefone
      t.text :genero
      t.text :meio_pagamento

      t.timestamps
    end
  end
end
