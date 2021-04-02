class RemoveShortlistFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :shortlist
  end
end
