# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_all_brand_uuids_and_names(brands = Brand.all)
  brands.pluck(:id, :name).map { |brand| "#{brand[0]} #{brand[1]}" }
end

User.create! name: "Admin User", email: "admin@example.com", password: "password"

5.times do
  Brand.create! name: Faker::Company.unique.name
end

brands = Brand.all

10.times do
  consumer = Consumer.create! name: Faker::Name.unique.name
  consumer.brand_affinities << brands.sample(rand(1 .. brands.length))
end

puts
puts "## Brands"
puts
Brand.includes(:followers).each do |brand|
  puts "#{brand.id} #{brand.name} -- is followed by:"
  puts brand.followers.map { |follower| "  #{follower.id} #{follower.name}" }
  puts
end

puts "## Consumers"
puts
Consumer.includes(:brand_affinities).each do |consumer|
  brands = get_all_brand_uuids_and_names(consumer.brand_affinities).join("\n  ")
  puts "#{consumer.id} #{consumer.name} -- has these brand affinities:\n  #{brands}"
  puts
end
