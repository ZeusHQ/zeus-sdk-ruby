require "httparty"

module Zeus::V1::Client
    class Core
        include HTTParty

        def self.get_env
            @env ||= ENV['RACK_ENV'] || ENV['RAILS_ENV']
        end

        def self.get_base_uri
            base_uri = "https://api.zeusdev.io" if self.get_env == "production"
            base_uri = "http://localhost:3000" if self.get_env != "production"

            base_uri
        end

        base_uri get_base_uri
        format :json
        follow_redirects true

        def initialize(auth_token)
            self.class.headers "Authorization" => "Bearer #{auth_token}" 
        end

        def check_domain(domain)
            self.class.get("/domains/exists", query: {domain: domain})
        end
    end
end