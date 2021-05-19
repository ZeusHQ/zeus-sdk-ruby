module ZeusSdk::V1
    class Image
        attr_accessor :raw, :image_id, :urls, :presigned_url, :presigned_post, :created_at, :updated_at

        def initialize(obj)
            self.raw = obj
            self.image_id = obj["id"]
            self.urls = obj["urls"]
            self.presigned_url = obj["presigned_url"]
            self.presigned_post = obj["presigned_post"]
            self.created_at = obj["created_at"]
            self.updated_at = obj["updated_at"]
        end

        def as_json(options={})
            return {
                id: self.image_id,
                urls: self.urls,
                presigned_url: self.presigned_url,
                presigned_post: self.presigned_post,
                created_at: self.created_at,
                updated_at: self.updated_at
            }
        end

        def to_s
            "Image(id: #{self.image_id},  urls: #{self.urls})"
        end
    end
end