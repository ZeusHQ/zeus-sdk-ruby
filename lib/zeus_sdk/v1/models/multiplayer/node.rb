module ZeusSdk::V1
    class Node
        attr_accessor :raw, :node_id, :document_id, :name, :type, :properties, :created_at, :updated_at

        def initialize(node)
            self.raw = node
            self.node_id = node["id"]
            self.document_id = node["document_id"]
            self.name = node["name"]
            self.type = node["type"]
            self.properties = node["properties"]
            self.created_at = node["created_at"]
            self.updated_at = node["updated_at"]
        end

        def as_json(options={})
            return {
                id: self.node_id,
                document_id: self.document_id,
                name: self.name,
                type: self.type,
                properties: self.properties,
                created_at: self.created_at,
                updated_at: self.updated_at
            }
        end
    end
end