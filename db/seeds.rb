require 'faker'

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


# Create an admin user
if !User.where(email: "admin@example.com").first
  admin = User.new(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
  admin.skip_confirmation!
  admin.save!
end


# Create a moderator
if !User.where(email: "moderator@example.com").first
  moderator = User.new(
    name:     'Moderator User',
    email:    'moderator@example.com',
    password: 'helloworld',
    role:     'moderator'
  )
  moderator.skip_confirmation!
  moderator.save!
end

# Create a member
if !User.where(email: "member@example.com").first
  member = User.new(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
  )
  member.skip_confirmation!
  member.save!
end

users = User.all

15.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end

 topics = Topic.all
# Create Posts
50.times do
  Post.create!(
    title:  Faker::Lorem.sentence,
    topic:  topics.sample,
    body:   Faker::Lorem.paragraph,
    user: users.sample
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

# Create an admin user
if !User.where(email: "admin@example.com").first
  admin = User.new(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
  admin.skip_confirmation!
  admin.save!
end


# Create a moderator
if !User.where(email: "moderator@example.com").first
  moderator = User.new(
    name:     'Moderator User',
    email:    'moderator@example.com',
    password: 'helloworld',
    role:     'moderator'
  )
  moderator.skip_confirmation!
  moderator.save!
end

# Create a member
if !User.where(email: "member@example.com").first
  member = User.new(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
  )
  member.skip_confirmation!
  member.save!
end




 10.times do
   Summary.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 summaries = Post.all



puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{User.count} user created"
puts "#{Topic.count} topic created"
puts "#{Summary.count} summary created"
