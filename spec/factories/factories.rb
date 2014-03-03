FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'swordfish'
  end

  factory :activity do
    name { Faker::Lorem.word }
    url { Faker::Internet.url }
    blurb { Faker::Lorem.words.join }
    things_needed { Faker::Lorem.words }
  end
end
