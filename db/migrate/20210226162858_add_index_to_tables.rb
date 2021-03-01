class AddIndexToTables < ActiveRecord::Migration[6.1]
  def change
    add_index :flatmate_preferences, :property_id
    add_index :house_preferences, :user_id
    add_index :individual_personalities, :user_id
    add_index :individual_personalities, :aggregate_id
    add_index :properties, :owner_id
    add_index :properties, :aggregate_id
    add_index :users, :email
  end
end
