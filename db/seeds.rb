puts "clearing database"
Place.delete_all
User.delete_all

puts "creating ghosts"
User.create!(username: 'boolicious', email: 'howdy@boody.com', password: 'booboo', death_date: '1/1/1234')
User.create(username: 'boobody', email: 'boo@boody.com', password: 'booboo', death_date: '1/2/1234')
User.create(username: 'booman', email: 'boom@boody.com', password: 'booboo', death_date: '12/1/1345')
User.create(username: 'boodyman', email: 'booboo@boody.com', password: 'booboo', death_date: '1/4/1678')

users = User.all

puts "creating spooky haunts"
Place.create(title:"Boo Manor",
             # photo: "https://res.cloudinary.com/dasl65i7y/image/upload/v1709117897/d5dvfcdjg95puqrgkpyq.webp",
             address:"Beelitz, Brandenburg",
             description:"Step into the eerie embrace of our haunted house, where creaky floorboards, flickering candlelight,
                          and ghostly whispers await your arrival.",
             price:800,
             user:users.sample)
Place.create(title:"Eclipse Manor",
             # photo: "https://res.cloudinary.com/dasl65i7y/image/upload/v1709117837/wwqwmqnwbgiu7rfbjlxv.jpg",
             address:"Geethowan",
             description:"Explore the darkness within Eclipse Manor, where the sun never fully rises, and the eternal
                          twilight casts an eerie glow upon the decaying walls, a haven for the restless spirits that dwell within.",
             price:1000,
             user_id:users.sample)
Place.create(title:"Misty Hollow Mansion",
             # photo: "https://res.cloudinary.com/dasl65i7y/image/upload/v1709117516/c9klb5oa2isvjxa2sxvu.webp",
             address:"Brandenburg",
             description:"Plunge into the depths of the Shadowed Abyss Tunnel, where darkness reigns supreme, and the echoes of unseen horrors
                          reverberate through its winding passages, daring you to venture further into the unknown.",
             price:1200,
             user:users.sample)
Place.create(title:"Shadowed Abyss Tunnel",
             # photo: "https://res.cloudinary.com/dasl65i7y/image/upload/v1709117476/c7dhm6lrm7dkfsqmuk1e.jpg",
             address:"Beelitz",
             description:"Plunge into the depths of the Shadowed Abyss Tunnel, where darkness reigns supreme, and the echoes of unseen horrors
                          reverberate through its winding passages, daring you to venture further into the unknown.",
             price:140,
             user:users.sample)
Place.create(title:"Haunted Forest Swing",
             # photo: "https://res.cloudinary.com/dasl65i7y/image/upload/v1709117505/u16fyuqk4orch43hvfgt.jpg",
             address:"Beelitz",
             description:"Discover the mysteries of Whispering Pines Estate, where the ancient trees sway in the moonlight,
                          and the house itself seems to murmur secrets to those who dare to listen. Say hi to Nicole, who has been stuck on the swing for over 100 years",
             price:1,
             user:users.sample)
Place.create(title:"Desolate Clown Manor",
             # photo: "https://res.cloudinary.com/dasl65i7y/image/upload/v1709117818/qi3mzbsdubcmusrnnlj3.jpg",
             address:"Beelitz",
             description:"Enter the forsaken halls of Desolate Clown Manor, where faded laughter echoes through the empty rooms,
                          and the eerie grins of forgotten jesters leer from cracked portraits, casting a sinister atmosphere over the once-vibrant abode.",
             price:14,
             user:users.sample)

places = Place.all()

5.times do
  Booking.create(start: Date.yesterday(), end: Date.tomorrow(), user: users.sample, place: places.sample)
end

puts "created #{User.count} ghosts"
puts "created #{Place.count} spooky haunts"
