class CreateTourDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_details do |t|
      t.integer :tour_id, foreign_key: true
      t.integer :employee_id, foreign_key: true
      t.integer :place_id, foreign_key: true
      t.datetime :start_day
      t.datetime :end_day

      t.timestamps
    end
  end
end
