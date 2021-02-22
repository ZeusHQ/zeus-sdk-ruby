require "httparty"

puts "Zeus Content"

module Zeus::V1::Client
    class Content
        SUBDOMAIN = "content"
        LOCAL_PORT = 3005

        include HTTParty
        include ServiceBase
    end
end
  