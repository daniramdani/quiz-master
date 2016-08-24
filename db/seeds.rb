# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

puts 'Questions'
x = 0
(1..10).each do |i|
  question = Question.create({:description => 'How many letters are there in the English alphabet?', :answer => '26'})
  puts 'Question: ' << question.id.to_s << ' Created'
end
