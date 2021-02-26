module Zeus::V1::Client
    class Document
        attr_accessor :id, :name, :created_at, :updated_at

        def initialize(doc)
            self.id = doc["id"]
            self.name = doc["name"]
            self.created_at = doc["created_at"]
            self.updated_at = doc["updated_at"]
        end
    end
end