source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.0.4'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


# Gems used to authenticate users.
gem 'omniauth-facebook'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :test do
  # Use MiniTest for testing.
  gem 'minitest'
  gem 'guard-minitest'

  # Use Capybara for integration testing.
  gem 'capybara'

  # Use factories instead of creating models manually.
  gem 'factory_girl_rails'

  # Use turn for pretty test reporting.
  gem 'turn'

  # Clean up the DB after every test.
  gem 'database_cleaner'
end

group :development do
  # Use the thin webserver instead of WEBrick in development.
  gem 'thin'
end
