class CreateFlatmatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :flatmate_preferences do |t|
      t.boolean :couples
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
