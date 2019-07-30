User.create!(name:  "Admin User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

#User
99.times do |n|
  name  = Faker::Games::Pokemon.name
  email = "example-#{n+1}@sun-asterisk.com"
  password = "sun-asterisk"
  User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password)
end


#Category
12.times do
  title = Faker::Games::Pokemon.move
  description = Faker::Games::Pokemon.location
  Category.create!(title:  title,
    description: description)
end

#Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..60]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
