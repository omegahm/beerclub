source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'

# Use postgresql as the database for Active Record
gem 'pg'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc2'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'font-awesome-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'asset_sync'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'bullet'
  gem 'hirb'
  gem 'lol_dba' # To find table in need of indexes run 'lol_dba db:find_indexes'
  gem 'mailcatcher'
  gem 'pry'
  gem 'quiet_assets'
end

group :test do
  gem 'factory_girl_rails', :require => false
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'fuubar'
end

group :test, :development do
  gem 'rspec-rails'
end

gem 'rack-mini-profiler', require: 'rack-mini-profiler'
gem 'rails_12factor' # required by Heroku
gem 'rails_serve_static_assets'

gem 'thin'
gem 'rack-timeout'

# Use unicorn as the app server
gem 'unicorn'

gem 'authlogic'
