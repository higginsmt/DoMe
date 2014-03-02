class Activity < ActiveRecord::Base
  belongs_to :user      # the user who submitted the activity
  has_many :adventures
  has_many :users, through: :adventures
  has_many :stories, through: :adventures

end
