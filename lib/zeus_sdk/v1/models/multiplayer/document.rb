module ZeusSdk::V1
    class Document
        attr_accessor :raw, :document_id, :name, :created_at, :updated_at

        def initialize(doc)
            self.raw = doc
            self.document_id = doc["id"]
            self.name = doc["name"]
            self.created_at = doc["created_at"]
            self.updated_at = doc["updated_at"]
        end

        def as_json(options={})
            return {
                id: self.document_id,
                name: self.name,
                created_at: self.created_at,
                updated_at: self.updated_at
            }
        end

        def to_s
            "Document(id: #{self.document_id}, name: #{self.name})"
        end
    end
end