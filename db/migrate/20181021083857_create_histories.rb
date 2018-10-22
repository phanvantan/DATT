class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id, foreign_key: true
      t.integer :tour_booking_id, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
