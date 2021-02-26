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
    end
end