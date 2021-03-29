require "active_support"

module ZeusSdk
  class Error < StandardError; end

  require "zeus_sdk/version"
  require "zeus_sdk/env"

  module V1
    # clients
    require "zeus_sdk/v1/service_base"
    require "zeus_sdk/v1/core"
    require "zeus_sdk/v1/secrets"
    require "zeus_sdk/v1/auth"
    require "zeus_sdk/v1/assets"
    require "zeus_sdk/v1/content"
    require "zeus_sdk/v1/multiplayer"

    # models
    require "zeus_sdk/v1/models/api_response"
    require "zeus_sdk/v1/models/auth/user"
    require "zeus_sdk/v1/models/auth/role"
    require "zeus_sdk/v1/models/auth/role_user"
    require "zeus_sdk/v1/models/auth/permission"
    require "zeus_sdk/v1/models/auth/waiting_list"
    require "zeus_sdk/v1/models/auth/waiting_list_email"
    
    require "zeus_sdk/v1/models/multiplayer/document"
    require "zeus_sdk/v1/models/multiplayer/node"
    require "zeus_sdk/v1/models/assets/image"
  end
end
