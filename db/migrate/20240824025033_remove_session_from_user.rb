class RemoveSessionFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :session_token
  end
end
