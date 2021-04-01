class CreateAggregatePersonalities < ActiveRecord::Migration[6.1]
  def change
    create_table :aggregate_personalities do |t|
      t.references :individual_personality, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
