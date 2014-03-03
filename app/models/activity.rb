class Activity < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id # the user who submitted the activity, can only be one
  has_many :adventures
  has_many :completed_users, through: :adventures, source: :user
end
