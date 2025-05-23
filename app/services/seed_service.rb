class SeedService
  def self.seed
    ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
    Booking.delete_all
    Room.delete_all
    Location.delete_all
    User.delete_all
    ["users", "rooms", "locations", "bookings"].each do |table_name|
      ActiveRecord::Base.connection.execute("DELETE FROM #{table_name}")
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='#{table_name}'")
    end

    users = []
    20.times do |i|
      users.push(FactoryBot.create(:user))
    end

    demo_user = User.create!(
      email: "avo@cado.com",
      full_name: "Avo Cado",
      username: "avocado",
      password: "secret",
      admin: true
    )

    locations = []
    locations_data.each do |location_data|
      next if Location.find_by(name: location_data[:name])
    
      location = Location.find_or_initialize_by(name: location_data[:name])
      location.description = location_data[:description]
      location.photo.attach(
        io: File.open(Rails.root.join("app/assets/images/locations/#{location_data[:photo_path]}")),
        filename: location_data[:photo_path]
      )
      location.save!
      locations.push(location)
    end


    rooms = []
    rooms_data.each do |room|
      next if Room.find_by(name: room[:name])

      room = Room.create!(
        name: room[:name],
        description: room[:description],
        location: room[:location],
        photo: File.open(Rails.root.join("app/assets/images/rooms/#{room[:photo_path]}")),
      )
      rooms.push(room)
    end

    bookings = []
    users.take(10).each do |user|
      bookings.push(
        FactoryBot.create(
          :booking,
          room: rooms.sample,
          user: user,
          booked_for: rand(1..6)
        )
      )
    end
  end

  def self.locations_data
    [
      {
        name: "Sky Tower",
        description: "SkyTower is more than just the tallest building in Romania. It introduces a new business office concept. It is a local pioneer in setting new standards of innovative solutions & design. It is an emblem of Bucharest's business environment expansion.",
        photo_path: "sky-tower.jpg",
        slug: "sky-tower",
      },
      {
        name: "City Gate",
        description: "City Gate is an A-class modern office building with an exquisite location in the North of Bucharest. Located in a quiet and peaceful neighborhood, it combines the natural atmosphere of Herastrau Park with the urban lifestyle. City Gate is an 18-storey building, with two independent towers, offering 47 843 m2 of leasable area. Located in Presei Libere Square, the first square entering in Bucharest coming from the airport, the towers act as a gateway to the city.",
        photo_path: "city-gate-romania.jpg",
        slug: "city-gate",
      },
      {
        name: "Timpuri Noi Square",
        description: "Timpuri Noi Square is designed as a dynamic urban project, with friendly environment and unique identity. One of 5 key urban districts, crossing Bucharest City Center, Timpuri Noi Square provides working, leisure and living functions, integrated into a mixed-use environment – modern, class A office complex, retail spaces & plaza, green areas and residential community. LEED PLATINUM certification has been awarded to all three buildings within the project, with the first two buildings certified in 2018, and the third one in 2020. The office development has been designed in a distinctive way, with a particular accent on green solutions & energy efficiency, emphasizing quality through modern simplicity and natural stone.",
        photo_path: "timpuri-noi-square.jpg",
        slug: "timpuri-noi-square",
      }
    ]
  end

  def self.rooms_data
    [
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
        location: Location.friendly.find("timpuri-noi-square") || Location.first,
        photo_path: "work-with-your-mates.jpg",
        slug: "work-with-your-mates",
      },
      {
        name: "Concrete rooms",
        description: "A space with a minimalistic industrial design. It has 8 separate individual desks, a spatious conference room and a kitchen area. It's ideal for startups and remote teams.",
        location: Location.friendly.find("timpuri-noi-square") || Location.first,
        photo_path: "concrete-rooms.jpg",
        slug: "concrete-rooms",
      }
    ]
  end
end