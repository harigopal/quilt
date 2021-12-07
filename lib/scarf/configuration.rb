module Scarf
  # Store configuration for this gem.
  class Configuration
    BACKGROUND = %w(#ff4040 #7f2020 #cc5c33 #734939 #bf9c8f #995200 #4c2900 #f2a200 #ffd580 #332b1a #4c3d00 #ffee00 #b0b386 #64664d #6c8020 #c3d96c #143300 #19bf00 #53a669 #bfffd9 #40ffbf #1a332e #00b3a7 #165955 #00b8e6 #69818c #005ce6 #6086bf #000e66 #202440 #393973 #4700b3 #2b0d33 #aa86b3 #ee00ff #bf60b9 #4d3949 #ff00aa #7f0044 #f20061 #330007 #d96c7b).freeze
    attr_accessor :font_family
    attr_accessor :font_weight
    attr_accessor :background_shape
    attr_accessor :background_colors

    def initialize
      @font_family = %w(sans-serif)
      # normal | bold | bolder | lighter | <number>
      @font_weight = 'normal'
      @background_shape = :circle
      @background_colors = BACKGROUND
    end
  end
end
