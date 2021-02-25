class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :user_type
      t.string :avatar
      t.text :about
      t.string :occupation
      t.string :gender
      t.string :couple
      t.string :pets
      t.string :smoking
      t.integer :min_budget
      t.integer :max_budget
      t.text :areas_looking

      t.timestamps
    end
  end
end
