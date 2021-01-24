require "httparty"

module Zeus
    module Sdk
        module V1
            module Clients
                class Secrets
                    include HTTParty
                    
                    def self.get_env
                        @env ||= ENV['RACK_ENV'] || ENV['RAILS_ENV']
                    end

                    def self.get_base_uri
                        return "https://secrets.zeusdev.co" if self.get_env == "production"
                        return "http://localhost:3002"
                    end

                    base_uri get_base_uri
                    format :json
                    follow_redirects true
                    
                    def initialize(params)
                        self.class.headers "X-ZEUS-AUTH-KEY" => params[:zeus_auth_key] if params.has_key?(:zeus_auth_key)
                    end

                    def get_project_environments(project_id)
                        self.class.get("/api/v1/project_environments", query: {project_id: project_id}, headers: {"FOO": "BAR"})
                    end
                end
            end
        end
    end
end
  