module Zeus
  module Sdk
    VERSION = "0.1.0"
    ENVIRONMENT = ENV['RACK_ENV'] || ENV['RAILS_ENV']
    IS_PRODUCTION = ENVIRONMENT == "production"
  end
end
