require "httparty"

module Zeus::V1::Client
    class Secrets
        SUBDOMAIN = "secrets"
        LOCAL_PORT = 3002

        include HTTParty
        include ServiceBase

        def list_secrets(query)
            self.class.get("/api/v1/secrets", query: query, headers: self.get_headers)
        end

        def get_secret(key)
            self.class.get("/api/v1/secrets/#{key}", headers: self.get_headers)
        end

        def set_secret(key, value)
            self.class.post("/api/v1/secrets", body: {secret: {key: key, value: value}}, headers: self.get_headers)
        end

        def delete_secret(key)
            self.class.post("/api/v1/secrets/#{key}", headers: self.get_headers)
        end
    end
end