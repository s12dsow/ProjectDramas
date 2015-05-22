# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



dicko = User.create(username: 's12dsow', password: "password")

matthew = User.create(username: "mmwho", password: "password")

coffee_prince = Drama.create(name: "Coffee Prince", summary: "boy meets girl which he thinks is a boy", content_url: "https://youtu.be/94UkVK4SyJQ")

ditto = Drama.create(name: "ditto", summary: "time traveling love that is not meant to be", content_url: "https://youtu.be/DrCn-HELAxE")

dicko_drama = UserDrama.create(user_id: 1, drama_id: 1, watched?: true, rating: 5, review: "loveeeed it!" )
matthew_drama = UserDrama.create(user_id: 2, drama_id: 2, watched?: true, rating: 5, review: "clearly loved it")


