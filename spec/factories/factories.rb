FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'swordfish'
  end

  factory :activity do
    user_id
    name { Faker::Lorem.word }
    url { Faker::Internet.url }
    blurb { Faker::Lorem.words }
    things_needed 'hi'
  end
end
