module Zeus::V1::Client
    class User
        attr_accessor :id, :name, :email, :email_verified, :first_name, :last_name, :created_at, :updated_at

        def initialize(user)
            self.id = user["id"]
            self.name = user["name"]
            self.first_name = user["first_name"]
            self.last_name = user["last_name"]
            self.email = user["email"]
            self.email_verified = user["email_verified"]
            self.created_at = user["created_at"]
            self.updated_at = user["updated_at"]
        end

        def as_json(options={})
            {
                id: self.id,
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