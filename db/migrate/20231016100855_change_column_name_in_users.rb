class ChangeColumnNameInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :CreateUsers, :name
  end
end
