require 'faker'

# Create Posts
50.times do
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  # user: users.sample,   # we have not yet associated Users with Comments
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

10.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Commerce.price
  )
end

# Create Questions
50.times do
  Question.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
questions = Post.all

# Create users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'youremail.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{User.count} user created"
