class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :user_type
      t.text :images
      t.text :blurb
      t.string :address
      t.string :postcode
      t.integer :price
      t.integer :deposit
      t.boolean :bills
      t.boolean :furnished
      t.boolean :parking
      t.boolean :outside_area
      t.boolean :disabled_access
      t.boolean :internet
      t.integer :occupant_count
      t.integer :room_count
      t.integer :min_age
      t.integer :max_age
      t.boolean :smoking
      t.boolean :pets
      t.boolean :genders
      t.string :occupations

      t.timestamps
    end
  end
end
