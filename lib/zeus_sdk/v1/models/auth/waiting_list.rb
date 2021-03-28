module ZeusSdk::V1
    class WaitingList
        attr_accessor :raw, :id, :name, :created_at, :updated_at

        def initialize(waiting_list)
            return if waiting_list.blank?
            self.raw = waiting_list
            self.id = waiting_list["id"]
            self.name = waiting_list["name"] if waiting_list.has_key?("name")
            self.created_at = waiting_list["created_at"] if waiting_list.has_key?("created_at")
            self.updated_at = waiting_list["updated_at"] if waiting_list.has_key?("updated_at")
        end

        def as_json(options={})
            {
                id: self.id,
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