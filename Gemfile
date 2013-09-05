source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails'

gem 'actionpack-action_caching'
gem 'asset_sync'
gem 'authlogic', github: 'binarylogic/authlogic'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'coffee-rails'
gem 'dalli'
gem 'font-awesome-rails'
gem 'highcharts-rails'
gem 'iron_worker_ng'
gem 'jbuilder'
gem 'jquery-rails'
gem 'memcachier'
gem 'newrelic_rpm'
gem 'pg'
gem 'prawn', '>= 1.0.0.rc2'
gem 'prawn_rails'
gem 'rack-mini-profiler', require: 'rack-mini-profiler'
gem 'rack-timeout'
gem 'rails-i18n'
gem 'rails_12factor' # required by Heroku
gem 'sass-rails'
gem 'uglifier'
gem 'yui-compressor'

group :production do
  gem 'justonedb'
  gem 'unicorn-rails'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'hirb'
  gem 'lol_dba' # To find table in need of indexes run 'lol_dba db:find_indexes'
  gem 'mailcatcher'
  gem 'pry'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails', require: false
  gem 'fuubar'
  gem 'rspec-rails'
end
