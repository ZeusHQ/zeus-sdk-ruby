require "active_support"

module ZeusClient
  class Error < StandardError; end

  require "zeus/version"
  require "zeus/env"

  module V1
    require "zeus/v1/client/service_base"
    require "zeus/v1/client/core"
    require "zeus/v1/client/secrets"
    require "zeus/v1/client/auth"
    require "zeus/v1/client/assets"
    require "zeus/v1/client/content"
    require "zeus/v1/client/multiplayer"
    # models
    require "zeus/v1/client/models/auth/user"
    require "zeus/v1/client/models/multiplayer/document"
    require "zeus/v1/client/models/multiplayer/node"
  end
end
