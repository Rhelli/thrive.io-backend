class CreateAggregatePersonalities < ActiveRecord::Migration[6.1]
  def change
    create_table :aggregate_personalities do |t|
      t.text :mbti_types
      t.text :interests
      t.text :skills
      t.text :religion
      t.string :politics
      t.string :exercise
      t.string :drinking
      t.string :education_level

      t.timestamps
    end
  end
end
