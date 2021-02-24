class CreateAggregatePersonalities < ActiveRecord::Migration[6.1]
  def change
    create_table :aggregate_personalities do |t|
      t.text :mbti_types
      t.text :interests
      t.text :religion
      t.text :politics
      t.text :exercise
      t.text :drinking
      t.text :education_level

      t.timestamps
    end
  end
end
