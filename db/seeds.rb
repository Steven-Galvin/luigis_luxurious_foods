Product.destroy_all
Review.destroy_all

50.times do |index|
  Product.create!(name: Faker::Lorem.sentence(2, false, 0).chop,
                  info: Faker::Lorem.sentence(15, false, 0).chop,
                  cost: rand(1..15),
                  origin: Faker::Address.country)
end

250.times do |index|
  Review.create!(author: Faker::Name.name,
                 content: Faker::Lorem.sentence(20, false, 0).chop,
                 rating: rand(1..5),
                 product_id: rand(0..49))
end
