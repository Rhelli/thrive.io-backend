class CreateFlatmatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :flatmate_preferences do |t|
      t.string :couples
      t.string :smoking
      t.string :pets
      t.string :occupation
      t.integer :min_age
      t.integer :max_age
      t.string :genders

      t.timestamps
    end
  end
end
