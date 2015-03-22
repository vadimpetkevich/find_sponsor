# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..100).each do
  User.create(
    password: '12345678',
    email: Faker::Internet.email,
    role: (Random.rand(0..10) % 2),
    login: Faker::Internet.user_name
  )
end

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
  login: 'castorg'
)

Investor.all.each do |investor|
  investor.first_name = Faker::Name.first_name,
  investor.last_name = Faker::Name.last_name,
  investor.skype = Faker::Internet.user_name,
  investor.birth_date = Faker::Date.between(90.years.ago, 10.years.ago),
  investor.branch = Faker::Lorem.sentence,
  investor.team_role = Faker::Lorem.sentence,
  investor.provide = Faker::Lorem.sentence
  investor.location = Faker::Lorem.sentence
  investor.save
end

Businessman.all.each do |businessman|
  businessman.first_name = Faker::Name.first_name,
  businessman.last_name = Faker::Name.last_name,
  businessman.skype = Faker::Internet.user_name,
  businessman.birth_date = Faker::Date.between(90.years.ago, 10.years.ago)
  businessman.save
end

(1..1000).each do
  Idea.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    branch: Faker::Lorem.sentence,
    location: Faker::Lorem.sentence,
    team: Faker::Lorem.sentence,
    plans: Faker::Lorem.sentence,
    demands: Faker::Lorem.sentence,
    businessman_id: Random.rand(1..Businessman.count)
  )
end


