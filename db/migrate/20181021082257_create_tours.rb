class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
