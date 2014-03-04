class Activity < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id # the user who submitted the activity, there can only be one
  has_many :adventures
  has_many :completed_users, through: :adventures, source: :user

  before_validation :smart_add_http_to_url
  validates_presence_of :name, :blurb, :things_needed, :user_id
  validates_format_of :url, with: URI.regexp(['http'])

  private

  def smart_add_http_to_url
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end

end
