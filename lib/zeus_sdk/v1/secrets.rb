require "httparty"

module ZeusSdk::V1
    class Secrets
        SUBDOMAIN = "secrets"
        LOCAL_PORT = 3002

        include HTTParty
        include ServiceBase

        def list_secrets(query)
            resp = self.class.get("/api/v1/secrets", query: query, headers: self.get_headers)
            return ApiResponse.new(resp)
        end

        def get_secret(key)
            resp = self.class.get("/api/v1/secrets/#{key}", headers: self.get_headers)
            return ApiResponse.new(resp)
        end

        def set_secret(key, value)
            body = {secret: {key: key, value: value}}
            resp = self.class.post("/api/v1/secrets", body: body.to_json, headers: self.get_headers)
            return ApiResponse.new(resp)
        end

        def delete_secret(key)
            resp = self.class.post("/api/v1/secrets/#{key}", headers: self.get_headers)
            return ApiResponse.new(resp)
        end
    end
end