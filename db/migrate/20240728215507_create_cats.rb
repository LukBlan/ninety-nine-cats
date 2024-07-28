class CreateCats < ActiveRecord::Migration[7.1]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description, null: false
      t.timestamps

      t.index :birth_date
      t.index :name
      t.index :sex
    end
  end
end
