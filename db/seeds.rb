# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

foto_links = ['https://i.natgeofe.com/n/1c235afb-4537-4c29-b165-08f8c17e01c3/Aman-i-Khas-Rajasthan-tent.jpg', "https://q-xx.bstatic.com/images/hotel/max1024x768/261/261169096.jpg", "https://media.camping-adriatic.com/_versions/krk/camping-krk-glamping-thumb_col-4.jpg", "https://i.pinimg.com/736x/e5/22/d1/e522d19b9a9e48673b0b63646e811a25--the-lotus-glamping.jpg", "https://img-www.truss-tent.com/wp-content/uploads/2019/08/geodesic-3.jpg"]

glamping_descriptions = ["a luxury type of camping that includes facilities and accommodation considered far more comfortable than traditional camping. It allows you to enjoy the freedom and closeness to nature that camping affords, without the uncomfortable aspects!",

 " as we know it today, can be traced back to the turn of the 20th Century. In 1908, Thomas Hiram Holding produced the The Camper's Handbook, which helped to popularise his love of camping in the outdoors as a recreational activity in the United Kingdom",

 "There is nothing more relaxing than enjoying a secluded glamping getaway in the US Virgin Islands. Featured as a BuzzWord! The word glamping is a blend of camping with the adjective glamorous, i.e. the notion of glamorous camping.",

 "Glamping is a portmanteau of glamorous and camping, and describes a style of camping with amenities and, in some cases, resort-style services not usually associated with traditional camping.",

 "Also called boutique camping, luxury camping, posh camping, or comfy camping, today's glamping features such structures as yurts, tipis, pods, bell tents, vintage caravans, vintage trailers, safari tents, tent cabins, and tree houses."]

GlampingSet.destroy_all
User.destroy_all
2.times do
  @user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
  @user.save!
end

10.times do
  glamping_set = GlampingSet.new(
    name: Faker::FunnyName.name,
    description: glamping_descriptions.sample,
    total_occupancy: rand(1..10),
    price_per_night: rand(200..2000),
    photo_url:"https://res.cloudinary.com/diuoggfm6/image/upload/v1653474303/cfbkwutifofdxpqevx28.jpg"
    )
    file = URI.open(foto_links.sample)
    glamping_set.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    glamping_set.user = @user
    glamping_set.save!
end





# # foto 1:  https://i.natgeofe.com/n/1c235afb-4537-4c29-b165-08f8c17e01c3/Aman-i-Khas-Rajasthan-tent.jpg

# foto 2: https://q-xx.bstatic.com/images/hotel/max1024x768/261/261169096.jpg

# foto3 :https://media.camping-adriatic.com/_versions/krk/camping-krk-glamping-thumb_col-4.jpg

# foto 4: https://i.pinimg.com/736x/e5/22/d1/e522d19b9a9e48673b0b63646e811a25--the-lotus-glamping.jpg

# foto 5: https://img-www.truss-tent.com/wp-content/uploads/2019/08/geodesic-3.jpg
