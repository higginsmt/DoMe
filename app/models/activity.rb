class Activity < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id, class_name: 'User' # the user who submitted the activity, there can only be one
  has_many :adventures
  has_many :completed_users, through: :adventures, source: :user

  before_validation :smart_add_http_to_url
  validates_presence_of :name, :blurb, :user_id
  validates_format_of :url, with: URI.regexp(['http'])

  # the map_code and map_code= methods parse the user input and save it into the database as "map"

  def map_code
    @map_code
  end

  def map_code=(user_input)
    self.map = user_input.gsub(/\bwidth="\d+%?"/, "width='100%'").gsub(/\bheight="\d+%?"/, "height='500'").gsub(/color:#....../, "color='white'").gsub(/(z=)(\d+)/) { $1 + ($2.to_i + 1).to_s }
    @map_code = user_input
  end

  private

  def smart_add_http_to_url
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end

end
