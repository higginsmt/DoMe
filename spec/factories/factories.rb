FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'swordfish'
  end


  factory :activity do
    name { Faker::Lorem.word }
    url { Faker::Internet.url }
    blurb { Faker::Lorem.words }
    things_needed { Faker::Lorem.words }
    # association :creator, factory: :user
  end
end
