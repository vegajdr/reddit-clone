# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(first_name: "Jorge", last_name: "Ramirez", password: "hunter2", email: "example@gmail.com")
user1 = User.create!(first_name: "David", last_name: "Vega", password: "hunter2", email: "sample@hotmail.com")
admin = User.create!(first_name: "Admin", last_name: "Account", password: "hunter2", email: "admin@admin.com", admin?: true)


subreddit = Room.create!(name: "Main", category: "General")
subreddit2 = Room.create!(name: "Articles", category: "Random")
no_moderators = Room.create!(name: "No Moderator", category: "Test")


# First Room
post = user1.messages.create!(text: "This is an amazing post!", title: "Front Page!", room_id: subreddit.id)
post2 = user.messages.create!(text: "Can't stop posting!", title: "Front Page!", room_id: subreddit.id)
post3 = user1.messages.create!(text: "I'm obsessed with this website!", title: "Check this out!", room_id: subreddit.id)
post4 = user.messages.create!(text: "I'll be so popular", title: "Relevant Stuff", room_id: subreddit.id)
post5 = user1.messages.create!(text: "I need to slow down", title: "Memes and Cats", room_id: subreddit.id)

# Second Room

post6 = user1.messages.create!(text: "This is an amazing post!", title: "Second Room!", room_id: subreddit2.id)
post7 = user.messages.create!(text: "Can't stop posting!", title: "New Stuff", room_id: subreddit2.id)
post8 = user1.messages.create!(text: "I'm obsessed with this website!", title: "YES!", room_id: subreddit2.id)
post9 = user.messages.create!(text: "I'll be so popular", title: "Second Room", room_id: subreddit2.id)
post10 = user1.messages.create!(text: "I need to slow down", title: "Memes and Cats", room_id: subreddit2.id)


moderator = Moderator.create!(user_id: user.id, room_id: subreddit.id)
moderator = Moderator.create!(user_id: user.id, room_id: subreddit2.id)

# votes

vote = user.votes.create!(message_id: post.id, vote: 1)
vote1 = user1.votes.create!(message_id: post.id, vote: 1)
vote2 = admin.votes.create!(message_id: post.id, vote: 1)

# (1...10).to_a.each do |i|
#   Vote.create!(message_id: 1, vote: 1)
# end
