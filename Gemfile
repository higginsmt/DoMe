source 'https://rubygems.org'

gem 'rails', '4.0.3'
gem 'pg'
gem 'dotenv-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'chronic'
gem 'time_difference' # Get time difference between two dates
gem 'jquery-rails'
gem 'coffee-rails'


group :production do
  gem 'rails_12factor'
end


group :test do
  gem 'capybara'  # Simulates a user clicking things in your app (testing)
  gem 'launchy'   # Opens app in a broswer
  gem 'faker'     # Populates fake data
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'guard-rspec', require: false
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
  gem 'coffee-rails-source-maps'
end

# Other gems you may find useful for development
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'bullet'
  gem 'debugger'
  gem 'quiet_assets'
  # gem 'rack-mini-profiler'  # for load times
  gem 'rails-erd', require: false   # makes model diagrams
  gem 'rails_best_practices', require: false
end
