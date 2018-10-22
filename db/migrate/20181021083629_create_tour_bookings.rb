class CreateTourBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_bookings do |t|
      t.integer :tour_detail_id, foreign_key: true
      t.string :name
      t.decimal :price
      t.integer :status
      t.datetime :time

      t.timestamps
    end
  end
end
