class ChangePropertiesOutsideAreaColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :outside_area, :string, array: true, default: []
  end
end
