class CreateHousePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :house_preferences do |t|
      t.boolean :smoking
      t.boolean :pets
      t.string :occupations
      t.integer :min_age
      t.integer :max_age
      t.string :genders

      t.timestamps
    end
  end
end
