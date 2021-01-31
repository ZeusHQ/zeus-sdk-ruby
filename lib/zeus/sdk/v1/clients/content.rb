require "httparty"

module Zeus
    module Sdk
        module V1
            module Clients
                class Content
                    SUBDOMAIN = "content"
                    LOCAL_PORT = 3005

                    include HTTParty
                    include ServiceBase

                    
                end
            end
        end
    end
end
  