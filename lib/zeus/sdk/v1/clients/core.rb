require "httparty"

module Zeus
    module Sdk
        module V1
            module Clients
                class Core
                    include HTTParty
                    
                    def self.get_env
                        @env ||= ENV['RACK_ENV'] || ENV['RAILS_ENV']
                    end

                    def self.get_base_uri
                        return "https://api.zeusdev.co" if self.get_env == "production"
                        return "http://localhost:3000"
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
        end
    end
end
  