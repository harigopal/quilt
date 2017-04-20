module Scarf
  # Store configuration for this gem.
  class Configuration
    attr_accessor :font_family

    def initialize
      @font_family = %w(sans-serif)
    end
  end
end
