class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :level_id
      t.integer :score
      t.integer :trial_number

      t.timestamps
    end
  end
end
