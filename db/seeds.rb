# start from cleanups
puts 'Cleaning up...'
Restaurant.destroy_all
Review.destroy_all

# do restaurants
puts 'Making 20 restaurants...'
20.times do
  Restaurant.create!(
    name: Faker::Coffee.blend_name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant::CATEGORY.sample
  )
end
puts "Done with #{Restaurant.count} restaurants..."

# do reviews
puts 'Making 40 reviews...'
100.times do
  Review.create!(
    content: Faker::Lorem.paragraph(sentence_count: 25, supplemental: false),
    rating: rand(0..5),
    restaurant_id: Restaurant.all.select(:id).map(&:id).sample
  )
end
puts "Done with #{Review.count} reviews..."
