# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'pg'

# 10.times do
#   title = "#{Faker::Lorem.characters(20)}?"
#   description = "#{Faker::Lorem.characters(50)}?"
#   user_id = "#{Faker::Number.number(5)}"
#   Question.create(title: title, description: description, user_id: user_id)
# end

10.times do
  description = "#{Faker::Coffee.notes}#{Faker::Coffee.notes}#{Faker::Coffee.notes}"
  user_id = "#{Faker::Number.number(5)}"
  question_id = "#{Faker::Number.between(1, 10)}"
  Answer.create(description: description, user_id: user_id, question_id: question_id)
end
