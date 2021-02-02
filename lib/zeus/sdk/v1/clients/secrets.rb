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

                    def list_secrets(query)
                        self.class.get("/api/v1/secrets", query: query, headers: self.get_headers)
                    end

                    def create_secret(secret)
                        self.class.post("/api/v1/secrets", body: {secret: secret}, headers: self.get_headers)
                    end

                    def get_secret(query)
                        key = query.delete("key")
                        self.class.get("/api/v1/secrets/#{key}", query: query, headers: self.get_headers)
                    end
                end
            end
        end
    end
end
  