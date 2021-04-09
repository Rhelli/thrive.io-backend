class DropUnusedTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :aggregate_personality
    drop_table :flatmate_preferences
    drop_table :house_preferences
    drop_table :individual_personalities
  end
end
