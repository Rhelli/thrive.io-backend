class CreateIndividualPersonalities < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_personalities do |t|
      t.integer :user_id
      t.integer :aggregate_id
      t.string :mbti_type
      t.text :interests, array: true, default: []
      t.string :religion
      t.string :politics, array: true, default: []
      t.string :exercise
      t.string :drinking
      t.string :education_level

      t.timestamps
    end
  end
end
