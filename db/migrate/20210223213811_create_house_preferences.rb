class CreateHousePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :house_preferences do |t|
      t.integer :user_id
      t.string :smoking
      t.text :pets, array: true, default: []
      t.string :occupation
      t.integer :min_age
      t.integer :max_age
      t.string :genders

      t.timestamps
    end
  end
end
