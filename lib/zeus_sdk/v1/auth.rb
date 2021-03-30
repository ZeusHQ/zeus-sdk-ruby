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

            return ApiResponse.new(resp)
        end

        def signup_with_email_password(user)
            body = {user: user}
            resp = self.class.post("/api/v1/users", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def get_users(query)
            resp = self.class.get("/api/v1/users", query: query, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def get_user(id)
            resp = self.class.get("/api/v1/users/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def create_user(attributes)
            body = {user: attributes}
            resp = self.class.post("/api/v1/users", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def update_user(id, attributes)
            body = {user: attributes}
            resp = self.class.put("/api/v1/users/#{id}", body: body.to_json, headers: self.get_headers).parsed_response
            
            return ApiResponse.new(resp)
        end

        def destroy_user(id)
            resp = self.class.delete("/api/v1/users/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end



        def get_waiting_lists(query)
            resp = self.class.get("/api/v1/waiting_lists", query: query, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def get_waiting_list(id)
            resp = self.class.get("/api/v1/waiting_lists/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def create_waiting_list(waiting_list)
            body = {waiting_list: waiting_list}
            resp = self.class.post("/api/v1/waiting_lists/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def update_waiting_list(id, attributes)
            body = {waiting_list: attributes}
            resp = self.class.put("/api/v1/waiting_lists/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def destroy_waiting_list(id)
            resp = self.class.delete("/api/v1/waiting_lists/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end



        def get_waiting_list_emails(query)
            resp = self.class.get("/api/v1/waiting_list_emails", query: query, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def get_waiting_list_email(id)
            resp = self.class.get("/api/v1/waiting_list_emails/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def create_waiting_list_email(waiting_list_email)
            body = {waiting_list_email: waiting_list_email}
            resp = self.class.post("/api/v1/waiting_list_emails/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def update_waiting_list_email(id, attributes)
            body = {waiting_list_email: attributes}
            resp = self.class.put("/api/v1/waiting_list_emails/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def destroy_waiting_list_email(id)
            resp = self.class.delete("/api/v1/waiting_list_emails/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end



        def get_roles(query)
            resp = self.class.get("/api/v1/roles", query: query, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def get_role(id)
            resp = self.class.get("/api/v1/roles/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def create_role(attributes)
            body = {role: attributes}
            resp = self.class.post("/api/v1/roles/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def update_role(id, attributes)
            body = {role: attributes}
            resp = self.class.put("/api/v1/roles/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def destroy_role(id)
            resp = self.class.delete("/api/v1/roles/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end



        def get_role_users(query)
            resp = self.class.get("/api/v1/role_users", query: query, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def get_role_user(id)
            resp = self.class.get("/api/v1/role_users/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def create_role_user(attributes)
            body = {role_user: attributes}
            resp = self.class.post("/api/v1/role_users/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def update_role_user(id, attributes)
            body = {role_user: attributes}
            resp = self.class.put("/api/v1/role_users/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def destroy_role_user(id)
            resp = self.class.delete("/api/v1/role_users/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end



        def get_permissions(query)
            resp = self.class.get("/api/v1/permissions", query: query, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def get_permission(id)
            resp = self.class.get("/api/v1/permissions/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def create_permission(permission)
            body = {permission: permission}
            resp = self.class.post("/api/v1/permissions/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def update_permission(id, attributes)
            body = {permission: attributes}
            resp = self.class.put("/api/v1/permissions/#{id}", body: body.to_json, headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end

        def destroy_permission(id)
            resp = self.class.delete("/api/v1/permissions/#{id}", headers: self.get_headers).parsed_response

            return ApiResponse.new(resp)
        end
    end

    class AuthJWT
        class << self
            def encode(data, key, exp = 6.months.from_now)
                payload = {
                    data: data,
                    exp: exp.to_i
                }
                JWT.encode(payload, key, 'HS256')
            end
       
            def decode(token, key)
                body = JWT.decode(token, key, true, { algorithm: 'HS256' })[0]
                HashWithIndifferentAccess.new body
            rescue
                nil
            end
        end
    end
end