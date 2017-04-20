module Scarf
  class InitialAvatar
    def initialize(name, font_family: [])
      @name = name
      @font_family = font_family
    end

    BACKGROUND = %w(#ff4040 #7f2020 #cc5c33 #734939 #bf9c8f #995200 #4c2900 #f2a200 #ffd580 #332b1a #4c3d00 #ffee00 #b0b386 #64664d #6c8020 #c3d96c #143300 #19bf00 #53a669 #bfffd9 #40ffbf #1a332e #00b3a7 #165955 #00b8e6 #69818c #005ce6 #6086bf #000e66 #202440 #393973 #4700b3 #2b0d33 #aa86b3 #ee00ff #bf60b9 #4d3949 #ff00aa #7f0044 #f20061 #330007 #d96c7b).freeze

    def svg
      <<~WRAPPER.gsub(/$\s+/, '').strip
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 100 100">
          <circle cx="50" cy="50" r="50" fill="#{fill}" />
          <text fill="#FFFFFF" font-size="50" font-family="#{font_family}" x="50" y="50" text-anchor="middle" alignment-baseline="central">#{initials}</text>
        </svg>
      WRAPPER
    end

    private

    # Default to sans-serif.
    def font_family
      (quoted_fonts + %w(sans-serif)).join(', ')
    end

    # Surround the font name with single quotes if there's a space in the name, and isn't quoted already.
    def quoted_fonts
      @font_family.map do |font|
        return font unless font.include?(' ')
        return font if font[0] == "'"
        "'#{font}'"
      end
    end

    # TODO: Need to add a hashing logic to ensure a supplied name always returns the same colour.
    def fill
      BACKGROUND.sample
    end

    # Upcase first letter of up to first two segments of the supplied name.
    def initials
      @name.split[0..1].map { |segment| segment[0] }.join('').upcase
    end
  end
end
