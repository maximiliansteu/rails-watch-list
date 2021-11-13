# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'clear data'

Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts 'insert data'

50.times do
  title = Faker::Movie.title
  unless Movie.find_by(title: title)
    Movie.create!(title: title,
                  overview: Faker::Movie.quote,
                  poster_url: "https://source.unsplash.com/1600x900/?#{title}",
                  rating: rand * 10)
  end
end

puts "created #{Movie.all.count}"

List.create!(name: 'All Time Favourites')

List.create!(name: 'Recommendations')

puts "created #{List.all.count}"
