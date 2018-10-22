class CreateUserTours < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tours do |t|
      t.integer :user_id, foreign_key: true
      t.integer :tour_id, foreign_key: true

      t.timestamps
    end
  end
end
