class AddColumnToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :picture, :string
  end
end
