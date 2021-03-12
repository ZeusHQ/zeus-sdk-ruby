require "httparty"

module ZeusClient::V1
    class Assets
        SUBDOMAIN = "assets"
        LOCAL_PORT = 3004

        include HTTParty
        include ServiceBase
    end
end