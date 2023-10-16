class DropColumnFromGroup < ActiveRecord::Migration[7.1]
  def change
    remove_column :groups, :user_id
  end
end
