require "httparty"

module ZeusClient::V1
    class Multiplayer
        SUBDOMAIN = "multiplayer"
        LOCAL_PORT = 3006

        include HTTParty
        include ServiceBase

        def list_documents(query)
            resp = self.class.get("/api/v1/documents", query: query, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return resp["objects"].map {|d| Document.new(d) }
            else
                return nil
            end
        end

        def create_document(document)
            resp = self.class.post("/api/v1/documents", body: {document: document}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Document.new(resp["object"])
            else
                return nil
            end
        end

        def get_document(id)
            resp = self.class.get("/api/v1/documents/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Document.new(resp["object"])
            else
                return nil
            end
        end

        def update_document(id, document)
            resp = self.class.put("/api/v1/documents/#{id}", body: {document: document}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Document.new(resp["object"])
            else
                return nil
            end
        end

        def destroy_document(id)
            resp = self.class.delete("/api/v1/documents/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Document.new(resp["object"])
            else
                return nil
            end
        end

        def list_nodes(query)
            resp = self.class.get("/api/v1/nodes", query: query, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return resp["objects"].map {|d| Node.new(d) }
            else
                return nil
            end
        end

        def create_node(node)
            resp = self.class.post("/api/v1/nodes", body: {node: node}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Node.new(resp["object"])
            else
                return nil
            end
        end

        def get_node(id)
            resp = self.class.get("/api/v1/nodes/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Node.new(resp["object"])
            else
                return nil
            end
        end

        def update_node(id, node)
            resp = self.class.put("/api/v1/nodes/#{id}", body: {node: node}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Node.new(resp["object"])
            else
                return nil
            end
        end

        def destroy_node(id)
            resp = self.class.delete("/api/v1/nodes/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Node.new(resp["object"])
            else
                return nil
            end
        end
    end

    class MultiplayerJWT
        class << self
            def encode(secret_key, payload, exp = 6.months.from_now)
                # payload[:exp] = exp.to_i
                payload = payload.to_json if payload.class != String
                JWT.encode(payload, secret_key)
            end
       
            def decode(secret_key, token)
                decoded = JWT.decode(token, secret_key)
                body = decoded[0]
                HashWithIndifferentAccess.new JSON.parse(body)
            rescue Exception => e
                puts("ERROR DECODING TOKEN")
                puts(e.inspect)
                nil
            end
        end
    end
end