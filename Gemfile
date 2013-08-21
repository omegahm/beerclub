source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'rails-i18n'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Use SCSS for stylesheets
gem 'sass-rails'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'font-awesome-rails'
gem 'yui-compressor'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

gem 'asset_sync'

gem 'newrelic_rpm'

# For printing to PDF
gem 'prawn', '>= 1.0.0.rc2'
gem 'prawn_rails'

gem 'highcharts-rails'

gem 'pg'

gem 'memcachier'
gem 'dalli'
gem 'actionpack-action_caching'

gem 'sentry-raven'

group :production do
  gem 'justonedb'
end

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
  gem 'factory_girl_rails', require: false
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'fuubar'
end

group :test, :development do
  gem 'rspec-rails'
end

gem 'rack-mini-profiler', require: 'rack-mini-profiler'
gem 'rails_12factor' # required by Heroku

gem 'thin', require: false
gem 'rack-timeout'

# Use unicorn as the app server
gem 'unicorn', require: false

gem 'authlogic', github: 'binarylogic/authlogic'
