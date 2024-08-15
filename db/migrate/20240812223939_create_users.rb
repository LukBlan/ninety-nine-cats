class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.index [:username]
      t.index [:password_digest]
      t.index [:session_token]
    end
  end
end
