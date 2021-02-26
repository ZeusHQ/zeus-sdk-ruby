module Zeus::V1::Client
    class Node
        attr_accessor :id, :document_id, :name, :type, :properties, :created_at, :updated_at

        def initialize(node)
            self.id = node["id"]
            self.name = node["name"]
            self.type = node["type"]
            self.properties = node["properties"]
            self.created_at = node["created_at"]
            self.updated_at = node["updated_at"]
        end
    end
end