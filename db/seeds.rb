#create users
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end
users = User.all
# Create items
30.times do
  Item.create!(
    name: Faker::Superhero.unique.name,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
