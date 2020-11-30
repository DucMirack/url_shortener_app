# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

require 'faker'

# Empty DB
UrlVisit.delete_all
ShortenedUrl.delete_all

# Fill DB

# Create shortened_urls
ShortenedUrl.create!(full_url: "https://wizville.fr/")
ShortenedUrl.create!(full_url: "https://www.google.com/")
ShortenedUrl.create!(full_url: "https://www.linguee.fr/")

# Create shortened_urls
current_date = DateTime.now.beginning_of_hour
ShortenedUrl.all.each do |url|
  (24*4).times do |hour_index|
    100.times do
      date = Faker::Time.between(from: (current_date + hour_index.hours), to: (current_date + (hour_index + 1).hours))
      UrlVisit.create!(shortened_url_id: url.id, created_at: date, updated_at: date)
    end
  end
end
