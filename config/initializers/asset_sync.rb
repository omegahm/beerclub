AssetSync.configure do |config|
  config.fog_provider = 'Google'
  config.fog_directory = ENV['FOG_DIRECTORY']
  config.google_storage_access_key_id = ENV['GOOGLE_STORAGE_ACCESS_KEY_ID']
  config.google_storage_secret_access_key = ENV['GOOGLE_STORAGE_SECRET_ACCESS_KEY']
  
  
  # Automatically replace files with their equivalent gzip compressed version
  config.gzip_compression = true
  
  # Fail silently.  Useful for environments such as Heroku
  config.fail_silently = true

  config.custom_headers = { '.*' => { Vary: 'Accept-Encoding' } }
end
