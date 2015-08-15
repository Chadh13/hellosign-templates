require 'fog/aws'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_KEY"]         # required
  }
  config.asset_host = "http://s3-us-west-2.amazonaws.com/heroku-direct-example"    #config.asset_host instead of config.fog_host for new fog gem versions
  config.fog_directory  = ENV["AWS_BUCKET"]                  # required
end