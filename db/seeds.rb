# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_user = User.create({name: "Gist Genius", provider: "github", uid: "9307313", created_at: "2014-10-19 19:26:59", updated_at: "2014-10-19 19:26:59", login: "gistgeniusdummy", token: "d159172b0b6f5697d9ec5eebbf90c2082f97a798"})
