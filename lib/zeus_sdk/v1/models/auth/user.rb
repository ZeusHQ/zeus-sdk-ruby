module ZeusSdk::V1
    class User
        attr_accessor :raw, :user_id, :name, :email, :email_verified, :first_name, :last_name, :created_at, :updated_at

        def initialize(user)
            return if user.blank?
            self.raw = user
            self.user_id = user["id"] if user.has_key?("id")
            self.name = user["name"] if user.has_key?("name")
            self.first_name = user["first_name"] if user.has_key?("first_name")
            self.last_name = user["last_name"] if user.has_key?("last_name")
            self.email = user["email"] if user.has_key?("email")
            self.email_verified = user["email_verified"] if user.has_key?("email_verified")
            self.created_at = user["created_at"] if user.has_key?("created_at")
            self.updated_at = user["updated_at"] if user.has_key?("updated_at")
        end

        def as_json(options={})
            {
                id: self.user_id,
                name: self.name,
                first_name: self.first_name,
                last_name: self.last_name,
                email: self.email,
                email_verified: self.email_verified,
                created_at: self.created_at,
                updated_at: self.updated_at
            }
        end

        def to_json(options={})
            self.as_json(options).to_json
        end
    end
end