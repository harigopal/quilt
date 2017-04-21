module Scarf
  # Store configuration for this gem.
  class Configuration
    attr_accessor :font_family
    attr_accessor :background_shape

    def initialize
      @font_family = %w(sans-serif)
      @background_shape = :circle
    end
  end
end
