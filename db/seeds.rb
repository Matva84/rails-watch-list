# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

URL = ["https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg"]

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

puts "Creating movies..."
15.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Lorem.sentences,
    poster_url: URL[rand(0..3)],
    rating: rand(0..100)/10
  )
  movie.save
end

puts "Creating lists..."
5.times do
  list = List.new(
    name: Faker::Music::RockBand.name
  )
  list.save
end

puts "Finished"
