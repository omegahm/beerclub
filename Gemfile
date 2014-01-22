source 'https://rubygems.org'

ruby '2.1.0'

gem 'rails'

gem 'actionpack-action_caching'
gem 'asset_sync'
gem 'authlogic', github: 'binarylogic/authlogic'
gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'dalli'
gem 'exception_notification'
gem 'font-awesome-rails'
gem 'highcharts-rails'
gem 'iron_worker_ng'
gem 'jbuilder'
gem 'jquery-rails'
gem 'memcachier'
gem 'newrelic_rpm'
gem 'prawn', '>= 1.0.0.rc2'
gem 'prawn_rails'
gem 'rack-timeout'
gem 'rails-i18n'
gem 'sass-rails'
gem 'uglifier'
gem 'unf'
gem 'yui-compressor'

group :production do
  gem 'mysql2'
  gem 'passenger'
  gem 'rails_12factor' # required by Heroku
end

group :development, :test do
  gem 'pg'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'foreman'
  gem 'hirb'
  gem 'lol_dba' # To find table in need of indexes run 'lol_dba db:find_indexes'
  gem 'mailcatcher'
  gem 'pry'
  gem 'quiet_assets'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails', require: false
  gem 'fuubar'
  gem 'rspec-rails'
end
