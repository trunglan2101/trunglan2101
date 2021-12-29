# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create!(name: "trung", email: "abc@abc.com", password: "111111", password_confirmation: "111111", 
#   admin: true,  activated: true,activated_at: Time.zone.now)

# 10.times.each do |i|
#   User.create!(name: "khanh", email: "khanh+#{i}@go.com", password: "111111", password_confirmation: "111111", 
#     admin: true,  activated: true,activated_at: Time.zone.now)
# end
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end