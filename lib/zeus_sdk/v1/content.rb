require "httparty"

module ZeusSdk::V1
    class Content
        SUBDOMAIN = "content"
        LOCAL_PORT = 3005

        include HTTParty
        include ServiceBase
    end
end
  