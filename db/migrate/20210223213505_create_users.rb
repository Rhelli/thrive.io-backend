class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :user_type
      t.string :avatar
      t.text :images
      t.text :about
      t.string :occupation
      t.string :gender
      t.boolean :couple
      t.boolean :pets
      t.boolean :smoking
      t.integer :min_budget
      t.integer :max_budget
      t.text :areas_looking

      t.timestamps
    end
  end
end
