require "active_support"

module ZeusClient
  class Error < StandardError; end

  require "zeus_client/version"
  require "zeus_client/env"

  module V1
    # clients
    require "zeus_client/v1/service_base"
    require "zeus_client/v1/core"
    require "zeus_client/v1/secrets"
    require "zeus_client/v1/auth"
    require "zeus_client/v1/assets"
    require "zeus_client/v1/content"
    require "zeus_client/v1/multiplayer"

    # models
    require "zeus_client/v1/models/auth/user"
    require "zeus_client/v1/models/multiplayer/document"
    require "zeus_client/v1/models/multiplayer/node"
  end
end
