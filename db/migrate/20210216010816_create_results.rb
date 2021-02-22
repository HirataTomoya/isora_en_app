class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :level_id
      t.integer :word_id
      t.integer :correct_judgment
      t.integer :cumulative_incorrect_number
      t.integer :continuous_incorrect_numbere

      t.timestamps
    end
  end
end
