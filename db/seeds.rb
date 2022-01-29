# 1.times do
#    user = User.create(name: "DudeKellington")
# end
# 3.times do
#    user = User.create(name: Faker::Internet.username)
# end


   p Entry.create([
      {
         galaxy: "Euclid",
         region: "SSO-8423",
         glyphs: "No Glyphs Available.",
         planets: "Pluto",
         dominant_lifeform: "Gek",
         economy: "Wealthy",
         conflict_level: "At War",
         notes: "Beautiful area.",
         user_id: 1
      }
   ])
