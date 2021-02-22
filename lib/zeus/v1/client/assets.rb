require "httparty"

puts "Zeus Assets"

module Zeus::V1::Client
    class Assets
        SUBDOMAIN = "assets"
        LOCAL_PORT = 3004

        include HTTParty
        include ServiceBase
    end
end