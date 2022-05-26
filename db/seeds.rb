# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
GlampingSet.destroy_all
User.destroy_all
2.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
  user.save!
  5.times do
    glamping_set = GlampingSet.new(
      name: Faker::FunnyName.name,
      description: Faker::Lorem.paragraph,
      total_occupancy: rand(1..10),
      price_per_night: rand(200..2000),
      photo_url:"https://res.cloudinary.com/diuoggfm6/image/upload/v1653474303/cfbkwutifofdxpqevx28.jpg"
      )
      file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
      glamping_set.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
      glamping_set.user = user
      glamping_set.save!
    end
  end


#   "https://source.unsplash.com/random"
#  glamping_set.photo.attach(io: URI.open(“https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg”), filename: ‘rp1.jpg’, content_type: ‘image/jpg’)
