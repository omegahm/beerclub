require 'raven'

Raven.configure do |config|
  config.environments = %w[ production, development ]
end
