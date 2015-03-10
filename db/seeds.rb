# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

('a'..'z').each { |s|
  User.create(password: '12345678', email: s + '@ex.by', role: (Random.rand(0..10) % 2), login: s + 'a')
}
