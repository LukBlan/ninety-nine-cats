class CreateSessionTable < ActiveRecord::Migration[7.1]
  def change
    create_table :session_tables do |t|
      t.integer :user_id, null: false
      t.string :session_token, null: false
    end
  end
end
