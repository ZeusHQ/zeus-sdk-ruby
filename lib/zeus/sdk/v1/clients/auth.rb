require "httparty"

module Zeus
    module Sdk
        module V1
            module Clients
                class Auth
                    SUBDOMAIN = "auth"
                    LOCAL_PORT = 3003

                    include HTTParty
                    include ServiceBase

                    
                end
            end
        end
    end
end
  