# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
    password: '12345678',
    email: 'petkevich.minsk@gmail.com',
    role: 0,
    login: 'vadim'
  )

User.create(
    password: '12345678',
    email: 'castorg@gmail.com',
    role: 1,
    login: 'maxim'
  )

(1..10).each do
  User.create(
    password: '12345678',
    email: Faker::Internet.email,
    role: (Random.rand(0..10) % 2),
    login: Faker::Internet.user_name
  )
end

Investor.all.each do |investor|
  investor.avatar = Faker::Avatar.image
  investor.first_name = Faker::Name.first_name
  investor.last_name = Faker::Name.last_name
  investor.skype = Faker::Internet.user_name
  investor.birth_date = Faker::Date.between(90.years.ago, 10.years.ago)
  investor.branch = Faker::Lorem.sentence
  investor.team_role = Faker::Lorem.sentence
  investor.provide = Faker::Lorem.sentence
  investor.location = Faker::Address.country
  investor.save
end

Businessman.all.each do |businessman|
  businessman.avatar = Faker::Avatar.image
  businessman.first_name = Faker::Name.first_name
  businessman.last_name = Faker::Name.last_name
  businessman.skype = Faker::Internet.user_name
  businessman.birth_date = Faker::Date.between(90.years.ago, 10.years.ago)
  businessman.save
end

(1..100).each do
  Idea.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    branch: Faker::Lorem.sentence(1),
    location: Faker::Address.country,
    team: Faker::Lorem.sentence,
    plans: Faker::Lorem.sentence,
    demands: Faker::Lorem.sentence,
    businessman_id: Random.rand(1..Businessman.count)
  )
end

Idea.all.each do |idea|
  idea.published = [true, false].sample
  idea.save
end

Idea.published.each do |published_idea|
  published_idea.liked_by Investor.find(Random.rand(1..Investor.count)), vote_scope: 'interesting'
  published_idea.liked_by Investor.find(Random.rand(1..Investor.count))
  published_idea.liked_by Investor.find(Random.rand(1..Investor.count))
  published_idea.disliked_by Investor.find(Random.rand(1..Investor.count))
end
















