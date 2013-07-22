require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Beerclub
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Copenhagen'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :da
    
    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.version = '1.0'

    # Needs to be false on Heroku 
    config.serve_static_assets = true
    config.static_cache_control = "public, max-age=31536000"
    
    # Add the fonts path
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')

    # Precompile additional assets
    config.assets.precompile += %w( *.svg *.eot *.woff *.ttf )
    config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif )
  end
end
