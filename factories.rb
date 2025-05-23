FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    full_name { Faker::Name.name }
    username { full_name.parameterize }
    password { "password" }
    admin { false }

    trait :admin do
      admin { true }
    end
  end

  factory :room do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    location
    photo { File.open(Rails.root.join("app/assets/images/rooms/default.avif")) }
  end

  factory :booking do
    booked_at { Faker::Time.between(from: 1.day.from_now, to: 1.month.from_now) }
    booked_for { Random.rand(1..6) }
    association :room, factory: :room
    association :user, factory: :user
  end
end