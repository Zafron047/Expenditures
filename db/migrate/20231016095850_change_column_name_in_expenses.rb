class ChangeColumnNameInExpenses < ActiveRecord::Migration[7.1]
  def change
    rename_column :expenses, :author_id_id, :author_id
  end
end
