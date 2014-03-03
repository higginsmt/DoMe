FactoryGirl.define do

  factory :user do
    # the value of each attribute is locked in when the factory is created
    # to create a new attribute every time, you need to run a code block (which is what we're doing with Faker)
    email { Faker::Internet.email }
    password 'swordfishtrombones'
  end

  # leaving this in here for later, if we want to do a factory for activities
  # factory :contact do
  #   first_name 'Tom'
  #   last_name 'Waits'
  #   phone '7891234'

  #   # this CREATES an associated user if one doesn't exist yet
  #   user
  # end

end
