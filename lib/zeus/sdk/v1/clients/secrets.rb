require "httparty"

module Zeus
    module Sdk
        module V1
            module Clients
                class Secrets
                    SUBDOMAIN = "secrets"
                    LOCAL_PORT = 3002

                    include HTTParty
                    include ServiceBase

                    
                end
            end
        end
    end
end
  