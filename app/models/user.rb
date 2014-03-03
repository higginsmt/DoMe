class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :adventures
  has_many :created_activities, class_name: Activity # Activities that a user has submitted
  has_many :completed_activities, through: :adventures, source: :activity # Activities a user has completed - need the adventure to connect user to the activity they completed
end
