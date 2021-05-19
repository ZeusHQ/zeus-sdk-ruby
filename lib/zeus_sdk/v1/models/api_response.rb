module ZeusSdk::V1
    class ApiResponse
        attr_accessor :raw, :success, :num_pages, :total, :page, :type

        def initialize(raw)
            return if raw.blank?
            self.raw = raw
            self.success = raw["success"] if raw.has_key?("success")
            self.num_pages = raw["num_pages"] if raw.has_key?("num_pages")
            self.total = raw["total"] if raw.has_key?("total")
            self.page = raw["page"] if raw.has_key?("page")
            self.type = raw["type"] if raw.has_key?("type")
        end

        def objects
            objs = self.raw["objects"]
            return [] if objs.blank?
            case self.type
            when "Zeus::Auth::User" then objs.map {|obj| User.new(obj) }
            when "Zeus::Auth::Permission" then objs.map {|obj| Permission.new(obj) }
            when "Zeus::Auth::Role" then objs.map {|obj| Role.new(obj) }
            when "Zeus::Auth::RoleUser" then objs.map {|obj| RoleUser.new(obj) }
            when "Zeus::Auth::WaitingList" then objs.map {|obj| WaitingList.new(obj) }
            when "Zeus::Auth::WaitingListEmail" then objs.map {|obj| WaitingListEmail.new(obj) }
            when "Zeus::Assets::Image" then objs.map {|obj| Image.new(obj) }
            when "Zeus::Multiplayer::Document" then objs.map {|obj| Document.new(obj) }
            when "Zeus::Multiplayer::Node" then objs.map {|obj| Node.new(obj) }
            end
        end

        def object
            obj = self.raw["object"]
            return nil if obj.blank?
            case self.type
            when "Zeus::Auth::User" then User.new(obj)
            when "Zeus::Auth::Permission" then Permission.new(obj)
            when "Zeus::Auth::Role" then Role.new(obj)
            when "Zeus::Auth::RoleUser" then RoleUser.new(obj)
            when "Zeus::Auth::WaitingList" then WaitingList.new(obj)
            when "Zeus::Auth::WaitingListEmail" then WaitingListEmail.new(obj)
            when "Zeus::Assets::Image" then Image.new(obj)
            when "Zeus::Multiplayer::Document" then Document.new(obj)
            when "Zeus::Multiplayer::Node" then Node.new(obj)
            end
        end

        def as_json(options={})
            self.raw
        end

        def to_json(options={})
            self.as_json(options).to_json
        end
    end
end