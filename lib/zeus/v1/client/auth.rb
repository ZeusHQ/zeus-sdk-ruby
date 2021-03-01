require "httparty"
require "jwt"

module Zeus::V1::Client
    class Auth
        SUBDOMAIN = "auth"
        LOCAL_PORT = 3003

        include HTTParty
        include ServiceBase

        def list_users(query)
            resp = self.class.get("/api/v1/users", query: query, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return resp["objects"].map {|u| User.new(u) }
            else
                return nil
            end
        end

        def signup_with_email_password(user)
            resp = self.class.post("/api/v1/users", body: {user: user}, headers: self.get_headers).parsed_response
        end

        def get_user(id)
            resp = self.class.get("/api/v1/users/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return User.new(resp["object"])
            else
                return nil
            end
        end
    end

    class AuthJWT
        class << self
            def encode(payload, exp = 6.months.from_now)
                payload[:exp] = exp.to_i
                JWT.encode(payload, ENV["ZEUS_AUTH_SECRET_KEY"])
            end
       
            def decode(token)
                body = JWT.decode(token, ENV["ZEUS_AUTH_SECRET_KEY"])[0]
                HashWithIndifferentAccess.new body
            rescue
                nil
            end
        end
    end
end