class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :owner_id
      t.integer :aggregate_id
      t.string :title
      t.text :blurb
      t.string :address
      t.string :town
      t.string :postcode
      t.integer :price
      t.integer :deposit
      t.string :bills
      t.string :furnished
      t.string :parking
      t.string :outside_area
      t.string :disabled_access
      t.string :internet
      t.integer :occupant_count
      t.integer :room_count
      t.integer :min_age
      t.integer :max_age
      t.string :smoking
      t.text :pets, array: true, default: []
      t.string :genders, array: true, default: []
      t.string :occupations, array: true, default: []

      t.timestamps
    end
  end
end
