require "httparty"

module Zeus
    module Sdk
        module V1
            module Clients
                class Assets
                    SUBDOMAIN = "assets"
                    LOCAL_PORT = 3004

                    include HTTParty
                    include ServiceBase

                    
                end
            end
        end
    end
end
  