require "active_support"

module Zeus
  class Error < StandardError; end

  require_relative "zeus/version"
  require_relative "zeus/env"

  module V1
    module Class
      require_relative "zeus/v1/client/service_base"
      require_relative "zeus/v1/client/core"
      require_relative "zeus/v1/client/secrets"
      require_relative "zeus/v1/client/auth"
      require_relative "zeus/v1/client/assets"
      require_relative "zeus/v1/client/content"
    end
  end
end
