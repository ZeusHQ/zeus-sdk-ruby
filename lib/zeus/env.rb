module ZeusClient
  ENVIRONMENT = ENV['RACK_ENV'] || ENV['RAILS_ENV']
  IS_PRODUCTION = ENVIRONMENT == "production"
end  