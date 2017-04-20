require 'digest/sha1'

require_relative 'scarf/configuration'
require_relative 'scarf/image_svg'
require_relative 'scarf/identicon'
require_relative 'scarf/initial_avatar'

# A Ruby library for generating initial avatars and identicons.
module Scarf
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
