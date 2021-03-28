module ZeusSdk::V1
    class RoleUser
        attr_accessor :raw, :id, :role_id, :user_id, :created_at, :updated_at

        def initialize(raw)
            return if raw.blank?
            self.raw = raw
            self.id = raw["id"]
            self.role_id = raw["role_id"] if raw.has_key?("role_id")
            self.user_id = raw["user_id"] if raw.has_key?("user_id")
            self.created_at = raw["created_at"] if raw.has_key?("created_at")
            self.updated_at = raw["updated_at"] if raw.has_key?("updated_at")
        end

        def as_json(options={})
            {
                id: self.id,
                role_id: self.role_id,
                user_id: self.user_id,
                created_at: self.created_at,
                updated_at: self.updated_at
            }
        end

        def to_json(options={})
            self.as_json(options).to_json
        end
    end
end