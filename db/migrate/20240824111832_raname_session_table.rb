class RanameSessionTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :session_tables, :sessions
  end
end
