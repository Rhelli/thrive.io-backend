class CreateShortlists < ActiveRecord::Migration[6.1]
  def change
    create_table :shortlists do |t|
      t.references :user
      t.references :property

      t.timestamps
    end
  end
end
