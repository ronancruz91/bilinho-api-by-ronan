class AddColumnToFatura < ActiveRecord::Migration[5.2]
	def change
                add_column :faturas, :matricula_id, :integer
        end
end
