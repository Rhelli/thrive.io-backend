class CreateIndividualPersonalities < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_personalities do |t|
      t.string :mbti_type
      t.text :interests
      t.string :religion
      t.string :politics
      t.string :exercise
      t.string :drinking
      t.string :education_level

      t.timestamps
    end
  end
end
