require "httparty"

module ZeusSdk::V1
    class Assets
        SUBDOMAIN = "assets"
        LOCAL_PORT = 3004

        include HTTParty
        include ServiceBase

        def list_images(query)
            resp = self.class.get("/api/v1/images", query: query, headers: self.get_headers).parsed_response
            return resp
        end

        def create_image(image)
            body = {image: image}
            resp = self.class.post("/api/v1/images", body: body.to_json, headers: self.get_headers).parsed_response
            return resp
        end

        def get_image(id)
            resp = self.class.get("/api/v1/images/#{id}", headers: self.get_headers).parsed_response
            return resp
        end

        def get_image_variants(id)
            resp = self.class.get("/api/v1/images/#{id}/variants", headers: self.get_headers).parsed_response
            return resp
        end

        def update_image(id, image)
            body = {image: image}
            resp = self.class.put("/api/v1/images/#{id}", body: body.to_json, headers: self.get_headers).parsed_response
            return resp
        end

        def destroy_image(id)
            resp = self.class.delete("/api/v1/images/#{id}", headers: self.get_headers).parsed_response
            return resp
        end
    end
end