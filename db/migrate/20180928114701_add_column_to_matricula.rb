class AddColumnToMatricula < ActiveRecord::Migration[5.2]
	def change
		add_column :matriculas, :aluno_id, :integer
		add_column :matriculas, :instituicao_id, :integer
	end
end
