source 'https://rubygems.org'

gem 'rails', '~> 3.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  # gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'figaro' # https://github.com/laserlemon/figaro
gem 'bcrypt-ruby'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :test do
 # gem 'turn'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'database_cleaner' # required by capybara
end

group :development do
  gem 'debugger'
  gem 'quiet_assets'
  gem 'thin'
  gem 'better_errors' # https://github.com/charliesome/better_errors
  gem 'binding_of_caller' # https://github.com/banister/binding_of_caller
end


