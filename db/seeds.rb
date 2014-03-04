# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Activity.create(name: "Hike the Middlesex Fells Reservation", blurb: "Awesome hike, the view at the top is great", url: "http://mass-parks.com", things_needed: "waterbottle, friends", user_id: 1)

Activity.create(name: "Go Sailing in Boston Harbor", blurb: "Boat like a boss!", url: "http://sailing.com", things_needed: "water, sailboat", user_id: 2)

Activity.create(name: "Go Kayaking on the Charles", blurb: "Kayaking is awesome", url: "http://kayaks.com", things_needed: "water, kayak", user_id: 3)

