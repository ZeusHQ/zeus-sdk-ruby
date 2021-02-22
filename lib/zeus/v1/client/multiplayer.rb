require "httparty"

module Zeus::V1::Client
    class Multiplayer
        SUBDOMAIN = "multiplayer"
        LOCAL_PORT = 3006

        include HTTParty
        include ServiceBase
    end
end