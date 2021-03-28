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

        def create_user(attributes)
            resp = self.class.post("/api/v1/users", body: {user: attributes}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return User.new(resp["object"])
            else
                return nil
            end
        end

        def update_user(id, attributes)
            resp = self.class.put("/api/v1/users/#{id}", body: {user: attributes}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return User.new(resp["object"])
            else
                return nil
            end
        end

        def destroy_user(id)
            resp = self.class.delete("/api/v1/users/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return User.new(resp["object"])
            else
                return nil
            end
        end

        def get_waiting_lists(query)
            resp = self.class.get("/api/v1/waiting_lists", query: query, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return resp["objects"].map {|u| WaitingList.new(u) }
            else
                return nil
            end
        end

        def get_waiting_list(id)
            resp = self.class.get("/api/v1/waiting_lists/#{id}", headers: self.get_headers).parsed_response

            if resp["success"] == true
                return WaitingList.new(resp["object"])
            else
                return nil
            end
        end

        def create_waiting_list(waiting_list)
            resp = self.class.post("/api/v1/waiting_lists/#{id}", body: {waiting_list: waiting_list}.to_json, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return WaitingList.new(resp["object"])
            else
                return nil
            end
        end

        def update_waiting_list(id, attributes)
            resp = self.class.put("/api/v1/waiting_lists/#{id}", body: {waiting_list: attributes}.to_json, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return WaitingList.new(resp["object"])
            else
                return nil
            end
        end

        def destroy_waiting_list(id)
            resp = self.class.delete("/api/v1/waiting_lists/#{id}", headers: self.get_headers).parsed_response

            if resp["success"] == true
                return WaitingList.new(resp["object"])
            else
                return nil
            end
        end

        def get_roles(query)
            resp = self.class.get("/api/v1/roles", query: query, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return resp["objects"].map {|u| Role.new(u) }
            else
                return nil
            end
        end

        def get_role(id)
            resp = self.class.get("/api/v1/roles/#{id}", headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Role.new(resp["object"])
            else
                return nil
            end
        end

        def create_role(role)
            resp = self.class.post("/api/v1/roles/#{id}", body: {role: role}.to_json, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Role.new(resp["object"])
            else
                return nil
            end
        end

        def update_role(id, attributes)
            resp = self.class.put("/api/v1/roles/#{id}", body: {role: attributes}.to_json, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Role.new(resp["object"])
            else
                return nil
            end
        end

        def destroy_role(id)
            resp = self.class.delete("/api/v1/roles/#{id}", headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Role.new(resp["object"])
            else
                return nil
            end
        end

        def get_permissions(query)
            resp = self.class.get("/api/v1/permissions", query: query, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return resp["objects"].map {|u| Permission.new(u) }
            else
                return nil
            end
        end

        def get_permission(id)
            resp = self.class.get("/api/v1/permissions/#{id}", headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Permission.new(resp["object"])
            else
                return nil
            end
        end

        def create_permission(permission)
            resp = self.class.post("/api/v1/permissions/#{id}", body: {permission: permission}.to_json, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Permission.new(resp["object"])
            else
                return nil
            end
        end

        def update_permission(id, attributes)
            resp = self.class.put("/api/v1/permissions/#{id}", body: {permission: attributes}.to_json, headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Permission.new(resp["object"])
            else
                return nil
            end
        end

        def destroy_permission(id)
            resp = self.class.delete("/api/v1/permissions/#{id}", headers: self.get_headers).parsed_response

            if resp["success"] == true
                return Permission.new(resp["object"])
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
       
            def decode(token, key)
                #ENV["ZEUS_AUTH_SECRET_KEY"]
                body = JWT.decode(token, key, true, { algorithm: 'HS256' })[0]
                HashWithIndifferentAccess.new body
            rescue
                nil
            end
        end
    end
end