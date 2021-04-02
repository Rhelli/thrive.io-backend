class AddShortlistToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :shortlist, :string, default: [], array: true
  end
end
