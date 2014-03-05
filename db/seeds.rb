# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

activity_1_map = "<iframe width='425' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Middlesex+Fells+Reservation,+Medford,+MA&amp;aq=0&amp;oq=middlesex+fells+&amp;sll=42.036922,-71.683501&amp;sspn=2.484505,3.966064&amp;ie=UTF8&amp;hq=Middlesex+Fells+Reservation,+Medford,+MA&amp;t=m&amp;ll=42.447137,-71.114541&amp;spn=0.04342,0.034501&amp;output=embed'></iframe><br /><small><a href='https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Middlesex+Fells+Reservation,+Medford,+MA&amp;aq=0&amp;oq=middlesex+fells+&amp;sll=42.036922,-71.683501&amp;sspn=2.484505,3.966064&amp;ie=UTF8&amp;hq=Middlesex+Fells+Reservation,+Medford,+MA&amp;t=m&amp;ll=42.447137,-71.114541&amp;spn=0.04342,0.034501' style='color:#0000FF;text-align:left'>View Larger Map</a></small>"

activity_2_map = "<iframe width='425' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Black+Rock+Sailing+School,+Marina+Park+Drive,+Boston,+MA+02210&amp;aq=&amp;sll=42.379344,-71.023521&amp;sspn=0.154449,0.247879&amp;ie=UTF8&amp;hq=Black+Rock+Sailing+School,&amp;hnear=Marina+Park+Dr,+Boston,+Massachusetts+02210&amp;ll=42.353848,-71.044276&amp;spn=0.006295,0.006295&amp;t=m&amp;output=embed'></iframe><br /><small><a href='https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Black+Rock+Sailing+School,+Marina+Park+Drive,+Boston,+MA+02210&amp;aq=&amp;sll=42.379344,-71.023521&amp;sspn=0.154449,0.247879&amp;ie=UTF8&amp;hq=Black+Rock+Sailing+School,&amp;hnear=Marina+Park+Dr,+Boston,+Massachusetts+02210&amp;ll=42.353848,-71.044276&amp;spn=0.006295,0.006295&amp;t=m' style='color:#0000FF;text-align:left'>View Larger Map</a></small>"

activity_3_map = "<iframe width='425' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=500+Broad+Canal+Way+Cambridge,+MA+02142&amp;aq=&amp;sll=42.375666,-71.082916&amp;sspn=0.077229,0.12394&amp;ie=UTF8&amp;hq=&amp;hnear=500+Broad+Canal+Way,+Cambridge,+Massachusetts+02142&amp;t=m&amp;z=14&amp;ll=42.362883,-71.082107&amp;output=embed'></iframe><br /><small><a href='https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=500+Broad+Canal+Way+Cambridge,+MA+02142&amp;aq=&amp;sll=42.375666,-71.082916&amp;sspn=0.077229,0.12394&amp;ie=UTF8&amp;hq=&amp;hnear=500+Broad+Canal+Way,+Cambridge,+Massachusetts+02142&amp;t=m&amp;z=14&amp;ll=42.362883,-71.082107' style='color:#0000FF;text-align:left'>View Larger Map</a></small>"

Activity.create(name: "Hike the Middlesex Fells Reservation", blurb: "Awesome hike, the view at the top is great", url: "http://mass-parks.com", things_needed: "waterbottle, friends", user_id: 1, map: activity_1_map)

Activity.create(name: "Go Sailing in Boston Harbor", blurb: "Boat like a boss!", url: "http://sailing.com", things_needed: "water, sailboat", user_id: 2, map: activity_2_map)

Activity.create(name: "Go Kayaking on the Charles", blurb: "Kayaking is awesome", url: "http://kayaks.com", things_needed: "water, kayak", user_id: 3, map: activity_3_map)

