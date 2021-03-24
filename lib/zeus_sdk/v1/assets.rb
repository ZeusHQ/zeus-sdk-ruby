require "httparty"

module ZeusSdk::V1
    class Assets
        SUBDOMAIN = "assets"
        LOCAL_PORT = 3004

        include HTTParty
        include ServiceBase

        def list_images(query)
            resp = self.class.get("/api/v1/images", query: query, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return resp["objects"].map {|d| Image.new(d) }
            else
                puts(resp.inspect)
                return nil
            end
        end

        def create_image(image)
            resp = self.class.post("/api/v1/images", body: {image: image}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Image.new(resp["object"])
            else
                return nil
            end
        end

        def get_image(id)
            resp = self.class.get("/api/v1/images/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Image.new(resp["object"])
            else
                return nil
            end
        end

        def get_image_variants(id)
            resp = self.class.get("/api/v1/images/#{id}/variants", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return resp["object"]
            else
                return nil
            end
        end

        def update_image(id, image)
            resp = self.class.put("/api/v1/images/#{id}", body: {image: image}.to_json, headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Image.new(resp["object"])
            else
                return nil
            end
        end

        def destroy_image(id)
            resp = self.class.delete("/api/v1/images/#{id}", headers: self.get_headers).parsed_response
            if resp["success"] == true
                return Image.new(resp["object"])
            else
                return nil
            end
        end
    end
end