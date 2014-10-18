Airbrake.configure do |config|
  config.api_key = '03c77002eed156a4f02616e582ead3b6'
  config.host    = 'errbit.welaika.com'
  config.port    = 80
  config.secure  = config.port == 443
end
