require "httparty"

puts "Zeus Auth"

module Zeus::V1::Client
    class Auth
        SUBDOMAIN = "auth"
        LOCAL_PORT = 3003

        include HTTParty
        include ServiceBase

        def list_users(query)
            self.class.get("/api/v1/users", query: query, headers: self.get_headers)
        end

        def signup_with_email_password(user)
            self.class.post("/api/v1/users", body: {user: user}, headers: self.get_headers)
        end

        def get_user(id)
            self.class.get("/api/v1/users/#{id}", headers: self.get_headers)
        end
    end
end