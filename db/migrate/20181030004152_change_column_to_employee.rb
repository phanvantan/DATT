class ChangeColumnToEmployee < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :position, :integer
  end
end
