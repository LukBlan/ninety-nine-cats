class CreateCatRentalRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: false, index: true
      t.date :start_date, null: false, index: true
      t.date :end_date, null: false, index: true
      t.string :status, null: false, default: "PENDING"
      t.timestamps
    end

    add_foreign_key :cat_rental_requests, :cats, column: :cat_id
  end
end
