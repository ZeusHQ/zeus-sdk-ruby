module ZeusSdk::V1
    class WaitingListEmail
        attr_accessor :raw, :id, :waiting_list_id, :name, :created_at, :updated_at

        def initialize(waiting_list_email)
            return if waiting_list_email.blank?
            self.raw = waiting_list_email
            self.id = waiting_list_email["id"]
            self.waiting_list_id = waiting_list_email["waiting_list_id"]
            self.name = waiting_list_email["name"] if waiting_list_email.has_key?("name")
            self.created_at = waiting_list_email["created_at"] if waiting_list_email.has_key?("created_at")
            self.updated_at = waiting_list_email["updated_at"] if waiting_list_email.has_key?("updated_at")
        end

        def as_json(options={})
            {
                id: self.id,
                waiting_list_id: self.waiting_list_id,
                name: self.name,
                created_at: self.created_at,
                updated_at: self.updated_at
            }
        end

        def to_json(options={})
            self.as_json(options).to_json
        end
    end
end