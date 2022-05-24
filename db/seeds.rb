# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
  user.save!
  10.times do
    glamping_set = GlampingSet.new(
      name: Faker::FunnyName.name,
      description: Faker::Lorem.paragraph,
      total_occupancy: rand(1..10),
      price_per_night: rand(200..2000),
      photo_url: "https://source.unsplash.com/random"
    )
    glamping_set.user = user
    glamping_set.save!
  end
end

# 10.times do
#   bookings = Booking.create(
#     start_date: Faker::Date.between(from: '2022-03-01', to: '2022-05-25'),
#     end_date: Faker::Date.between(from: '2022-03-01', to: '2022-05-25'),
#     price_per_night: Faker::Number.between(from: 100, to: 2000),
#     set_id:
#     guest_id:
#     pickup_type: ["delivery", "pick-up", "delivery plus installation",].sample
#   )
# end
