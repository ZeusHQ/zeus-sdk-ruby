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
                    
                    attr_accessor :zeus_auth_key, :public_key, :secret_key, :project_id, :scope, :environment_id

                    def initialize(params)
                        if params[:zeus_auth_key] == nil && params[:public_key] == nil && params[:secret_key] == nil
                            throw Exception, "Must initialize with public_key and secret_key"
                        end

                        @zeus_auth_key = params[:zeus_auth_key]
                        @public_key = params[:public_key]
                        @secret_key = params[:secret_key]
                        @project_id = params[:project_id]
                        @scope = params[:scope]
                        @environment_id = params[:environment_id]
                    end

                    def get_headers
                        headers = {}

                        headers["X-ZEUS-AUTH-KEY"] = self.zeus_auth_key if self.zeus_auth_key.present?
                    
                        headers["X-ZEUS-SERVICE-PUBLIC-KEY"] = self.public_key if self.public_key.present?
                        headers["X-ZEUS-SERVICE-SECRET-KEY"] = self.secret_key if self.secret_key.present?
                        

                        headers["X-ZEUS-PROJECT-ID"] = self.project_id if self.project_id.present?
                        headers["X-ZEUS-SCOPE"] = self.scope if self.scope.present?
                        headers["X-ZEUS-ENVIRONMENT-ID"] = self.environment_id if self.environment_id.present?

                        headers
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
  