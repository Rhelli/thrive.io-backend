class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :properties, :users, column: 'owner_id'
    add_foreign_key :flatmate_preferences, :properties, column: 'property_id'
    add_foreign_key :house_preferences, :users, column: 'user_id'
    add_foreign_key :individual_personalities, :users, column: 'user_id'
  end
end
