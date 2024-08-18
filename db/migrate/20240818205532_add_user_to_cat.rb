class AddUserToCat < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :user_id, :integer, null: false
    add_index :cats, :user_id
    add_foreign_key :cats, :users, column: :user_id
  end
end
