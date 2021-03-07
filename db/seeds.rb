# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# CSV.foreach('db/result_seed.csv') do |row|
#   Result.create(:user_id => row[0],
#                     :level_id => row[1],
#                     :word_id => row[2],
#                     :practice_id => row[3])
# end

# CSV.foreach('db/word_seed.csv') do |row|
#   Word.create(:word_id => row[0],
#                     :word_en => row[1],
#                     :word_jp => row[2],
#                     :level_id => row[3],
#                     :category_id => row[4],
#                     :practice_id => row[5])
# end

# CSV.foreach('db/user_seed.csv') do |row|
#   User.create(:user_id => row[0],
#                     :password => row[1])
# end



# CSV.foreach('db/score_seed_0.csv') do |row|
#   Score.create(:user_id => row[0],
#                     :level_id => row[1])
# end

CSV.foreach('db/word_seed_0.csv') do |row|
  Word.create(:word_id => row[0],
                    :word_en => row[1],
                    :word_jp => row[2],
                    :level_id => row[3],
                    :category_id => row[4],
                    :practice_id => row[5])
end

# CSV.foreach('db/result_seed_0.csv') do |row|
#   Result.create(:user_id => row[0],
#                     :level_id => row[1],
#                     :word_id => row[2],
#                     :practice_id => row[3])
# end