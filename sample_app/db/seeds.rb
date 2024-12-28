# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

password = "piyopiyo"

users = [
  {
    name: "Michael Hartl",
    email: "example@railstutorial.jp",
    password: password,
    password_confirmation: password,
  },
]

99.times do
  users << {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
  }
end

print "Creating users"
users.each.with_index do |user, i|
  User.create!(user)
  print "."
end
puts ""
puts "Done!"
