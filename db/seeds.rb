#====================#
#    User Seeds      #
#====================#

users = [
  {
    email: "avo@cado.com",
    username: "avocado",
    full_name: "Avo Cado",
    password: "password",
    admin: true,
  },
  {
    email: "sarah.miller@gmail.com",
    username: "sarahm",
    full_name: "Sarah Miller",
    password: "password",
    admin: false,
  },
  {
    email: "james.chen@yahoo.com",
    username: "jchen",
    full_name: "James Chen",
    password: "password",
    admin: false,
  },
  {
    email: "elena.popov@outlook.com",
    username: "elenapop",
    full_name: "Elena Popov",
    password: "password",
    admin: false,
  },
  {
    email: "marcus.brown@gmail.com",
    username: "mbrown",
    full_name: "Marcus Brown",
    password: "password",
    admin: false,
  },
  {
    email: "laura.schmidt@hotmail.com",
    username: "lschmidt",
    full_name: "Laura Schmidt",
    password: "password",
    admin: false,
  },
  {
    email: "raj.patel@gmail.com",
    username: "rpatel",
    full_name: "Raj Patel",
    password: "password",
    admin: false,
  },
  {
    email: "sofia.garcia@yahoo.com",
    username: "sgarcia",
    full_name: "Sofia Garcia",
    password: "password",
    admin: false,
  },
  {
    email: "alex.wong@gmail.com",
    username: "awong",
    full_name: "Alex Wong",
    password: "password",
    admin: false,
  },
  {
    email: "nina.kovac@outlook.com",
    username: "nkovac",
    full_name: "Nina Kovac",
    password: "password",
    admin: false,
  },
  {
    email: "thomas.anderson@gmail.com",
    username: "tanderson",
    full_name: "Thomas Anderson",
    password: "password",
    admin: false,
  },
  {
    email: "maria.silva@hotmail.com",
    username: "msilva",
    full_name: "Maria Silva",
    password: "password",
    admin: false,
  },
  {
    email: "david.kim@yahoo.com",
    username: "dkim",
    full_name: "David Kim",
    password: "password",
    admin: false,
  },
  {
    email: "ana.ionescu@gmail.com",
    username: "aionescu",
    full_name: "Ana Ionescu",
    password: "password",
    admin: false,
  },
  {
    email: "lucas.mueller@outlook.com",
    username: "lmueller",
    full_name: "Lucas Mueller",
    password: "password",
    admin: false,
  },
  {
    email: "emma.wilson@gmail.com",
    username: "ewilson",
    full_name: "Emma Wilson",
    password: "password",
    admin: false,
  }
]

users.each do |user|
  User.find_or_create_by(email: user[:email]) do |u|
    u.username = user[:username]
    u.full_name = user[:full_name]
    u.password = user[:password]
    u.admin = user[:admin] || false
  end
end

#====================#
#    Location Seeds  #
#====================#

locations = [
  {
    name: "Sky Tower",
    description: "SkyTower is more than just the tallest building in Romania. It introduces a new business office concept. It is a local pioneer in setting new standards of innovative solutions & design. It is an emblem of Bucharest's business environment expansion.",
    photo_path: "sky-tower.jpg",
    slug: "sky-tower",
  },
  {
    name: "City Gate",
    description: "City Gate is a high-end office building located in the North of Bucharest.",
    photo_path: "city-gate-romania.jpg",
    slug: "city-gate",
  },
  {
    name: "Timpuri Noi Square",
    description: "Timpuri Noi Square is a dynamic new urban pole, one of the main 5 crossing Bucharest Center, providing working, leisure and living functions.",
    photo_path: "timpuri-noi-square.jpg",
    slug: "timpuri-noi-square",
  }
]

locations.each do |location_data|
  next if Location.find_by(name: location_data[:name])
  
  location = Location.find_or_initialize_by(name: location_data[:name])
  location.description = location_data[:description]
  location.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/locations/#{location_data[:photo_path]}")),
    filename: location_data[:photo_path]
  )
  location.save!
end


#====================#
#    Room Seeds      #
#====================#

rooms = [
  {
    name: "Desk with a View",
    description: "Private office with a view of the city.",
    location: Location.friendly.find("sky-tower") || Location.first,
    photo_path: "desk-with-a-view.jpg",
    slug: "desk-with-a-view",
  },
  {
    name: "Collab over a window",
    description: "A wide space designed for collaboration with a nice view of Bucharest's skyline.",
    location: Location.friendly.find("sky-tower") || Location.first,
    photo_path: "collab-over-a-window.jpg",
    slug: "collab-over-a-window",
  },
  {
    name: "Dark space",
    description: "A space with controlled amount of lighting to help you focus and get work done.",
    location: Location.friendly.find("city-gate") || Location.first,
    photo_path: "dark-space.jpg",
    slug: "dark-space",
  },
  {
    name: "Be a Director",
    description: "A collaborative co-working space with 4 standard desks and a main desk.",
    location: Location.friendly.find("timpuri-noi-square") || Location.first,
    photo_path: "be-a-director.jpg",
    slug: "be-a-director",
  },
  {
    name: "Work with your mates",
    description: "A space designed for extended collaboration with a big table for up to 8 people. It includes a ping-pong table and a mini-bar to distend yourself whenever you see fit.",
    location: Location.friendly.find("timpuri-noi-square"),
    photo_path: "work-with-your-mates.jpg",
    slug: "work-with-your-mates",
  },
  {
    name: "Concrete rooms",
    description: "A space with a minimalistic industrial design. It has 8 separate individual desks, a spatious conference room and a kitchen area. It's ideal for startups and remote teams.",
    location: Location.friendly.find("timpuri-noi-square"),
    photo_path: "concrete-rooms.jpg",
    slug: "concrete-rooms",
  }
]

rooms.each do |room_data|
  next if Room.exists?(slug: room_data[:slug])
  
  room = Room.find_or_initialize_by(name: room_data[:name])
  room.description = room_data[:description]
  room.location = room_data[:location]
  room.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/rooms/#{room_data[:photo_path]}")),
    filename: room_data[:photo_path]
  )
  room.save!
end
