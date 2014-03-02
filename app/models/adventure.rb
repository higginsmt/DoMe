class Adventure < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  has_one :story
end
