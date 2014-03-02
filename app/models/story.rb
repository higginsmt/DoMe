class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure
  belongs_to :activity
end
