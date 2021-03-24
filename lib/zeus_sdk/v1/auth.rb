require "httparty"
require "jwt"

module ZeusSdk::V1
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
            resp = self.class.post("/api/v1/users", body: {user: user}.to_json, headers: self.get_headers).parsed_response
        end

        def get_users(query)
            resp = self.class.get("/api/v1/users", query: query, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return resp["objects"].map {|u| User.new(u) }
            else
                return nil
            end
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
            def encode(data, key, exp = 6.months.from_now)
                payload = {
                    data: data,
                    exp: exp.to_i
                }
                #ENV["ZEUS_AUTH_SECRET_KEY"]
                JWT.encode(payload, key, 'HS256')
            end
       
            def decode(token)
                #ENV["ZEUS_AUTH_SECRET_KEY"]
                body = JWT.decode(token, key, true, { algorithm: 'HS256' })[0]
                HashWithIndifferentAccess.new body
            rescue
                nil
            end
        end
    end
end