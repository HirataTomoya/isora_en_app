class AddContinuousVisitCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :continuous_visit_count, :integer
  end
end
