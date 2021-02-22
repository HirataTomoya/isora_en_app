class AddPracticeIdToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :practice_id, :integer
  end
end
