User.create!(name:  "Admin User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

#User
45.times do |n|
  name  = Faker::TvShows::DrWho.character
  email = "example-#{n+1}@sun-asterisk.com"
  password = "sun-asterisk"
  User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password)
end

#Category
12.times do
  title = Faker::Games::Pokemon.name
  description = Faker::Games::Pokemon.move
  Category.create!(title:  title,
    description: description)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
