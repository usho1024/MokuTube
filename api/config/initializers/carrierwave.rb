require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.asset_host = 'http://localhost:3000' if Rails.env.development?

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory = 'mokutube'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
    region: 'ap-northeast-1',
    path_style: true
  }
end
