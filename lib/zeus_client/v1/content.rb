require "httparty"

module ZeusClient::V1
    class Content
        SUBDOMAIN = "content"
        LOCAL_PORT = 3005

        include HTTParty
        include ServiceBase
    end
end
  