require "httparty"

module Zeus
    module Sdk
        module V1
            module Clients
                module ServiceBase
                    def self.included(klass)
                        klass.format :json
                        klass.follow_redirects true
                        klass.base_uri Zeus::Sdk::IS_PRODUCTION ? "https://#{klass::SUBDOMAIN}.zeusdev.co" : "http://localhost:#{klass::LOCAL_PORT}"
                    end
                    
                    attr_accessor :zeus_auth_key, :public_key, :secret_key

                    def initialize(params)
                        if params[:zeus_auth_key] == nil && params[:public_key] == nil && params[:secret_key] == nil
                            throw Exception, "Must initialize with public_key and secret_key"
                        end

                        @zeus_auth_key = params[:zeus_auth_key]
                        @public_key = params[:public_key]
                        @secret_key = params[:secret_key]
                    end

                    def get_headers
                        if self.zeus_auth_key != nil
                            {"X-ZEUS-AUTH-KEY": self.zeus_auth_key}
                        else
                            {
                                "X-ZEUS-SERVICE-PUBLIC-KEY": self.public_key,
                                "X-ZEUS-SERVICE-SECRET-KEY": self.secret_key,
                            }
                        end
                    end

                    def get_project_environments(project_id)
                        self.class.get("/api/v1/project_environments", query: {project_id: project_id}, headers: self.get_headers)
                    end

                    def create_project_environment(project_environment)
                        self.class.post("/api/v1/project_environments", body: {project_environment: project_environment}, headers: self.get_headers)
                    end
                end
            end
        end
    end
end
  