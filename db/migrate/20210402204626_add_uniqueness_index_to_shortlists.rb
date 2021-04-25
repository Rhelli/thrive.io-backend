class AddUniquenessIndexToShortlists < ActiveRecord::Migration[6.1]
  def change
    add_index :shortlists, [:user_id, :property_id], unique: true
  end
end
