class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.integer :word_id
      t.string :word_en
      t.string :word_jp
      t.integer :level_id
      t.integer :category_id

      t.timestamps
    end
  end
end
