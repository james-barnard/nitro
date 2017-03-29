CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],                        # required
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],                        # required
      region:                'us-east-2'                  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'nitro-kaffe-chatbot-images'                          # required
    config.fog_public     = false                                        # optional, defaults to true

    config.storage = :fog
  end
end

