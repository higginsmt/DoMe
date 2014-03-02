class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :adventures                         # An adventure joins activities and users

  has_many :activities, through: :adventures   # Activities the user completed
  has_many :activities                         # Activities the user submitted
  has_many :stories, through: :adventures      # Stories (attached to the adventure)

end