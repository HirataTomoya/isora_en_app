class AddAnsweredToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :answered, :integer
  end
end
