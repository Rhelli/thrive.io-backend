class CreateFlatmatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :flatmate_preferences do |t|
      t.integer :property_id
      t.string :couples
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
