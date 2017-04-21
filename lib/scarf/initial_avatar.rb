module Scarf
  class InitialAvatar
    def initialize(name, font_family: [], background_shape: nil)
      @name = name
      @font_family = font_family.length.zero? ? Scarf.configuration.font_family : font_family
      @background_shape = background_shape.nil? ? Scarf.configuration.background_shape : background_shape
    end

    BACKGROUND = %w(#ff4040 #7f2020 #cc5c33 #734939 #bf9c8f #995200 #4c2900 #f2a200 #ffd580 #332b1a #4c3d00 #ffee00 #b0b386 #64664d #6c8020 #c3d96c #143300 #19bf00 #53a669 #bfffd9 #40ffbf #1a332e #00b3a7 #165955 #00b8e6 #69818c #005ce6 #6086bf #000e66 #202440 #393973 #4700b3 #2b0d33 #aa86b3 #ee00ff #bf60b9 #4d3949 #ff00aa #7f0044 #f20061 #330007 #d96c7b).freeze

    def svg
      <<~WRAPPER.gsub(/$\s+/, '').strip
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 100 100">
          #{background}
          <text fill="#{foreground_fill}" font-size="50" font-family="#{quoted_fonts}" x="50" y="50" text-anchor="middle" alignment-baseline="central">#{initials}</text>
        </svg>
      WRAPPER
    end

    private

    def background
      case(@background_shape)
        when :square
          return "<rect width=\"100\" height=\"100\" fill=\"#{background_fill}\" />"
        when :circle
          return "<circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#{background_fill}\" />"
        else
          raise "Unknown background_shape #{@background_shape} supplied to Scarf::InitialAvatar"
      end
    end

    # Surround the font name with single quotes if there's a space in the name, and isn't quoted already.
    def quoted_fonts
      quoted_fonts = @font_family.map do |font|
        if font.include?(' ') && font[0] != "'"
          "'#{font}'"
        else
          font
        end
      end

      quoted_fonts.join(', ')
    end

    # Returns a deterministic background fill for a given name.
    def background_fill
      @background_fill ||= begin
        digest = "0.#{Digest::MD5.hexdigest(@name).to_i(16).to_s}".to_f
        index = (digest * (BACKGROUND.length - 1)).round
        BACKGROUND[index]
      end
    end

    # Returns either black or white, optimizing contrast against background color.
    def foreground_fill
      red = background_fill[1..2].to_i(16)
      green = background_fill[3..4].to_i(16)
      blue = background_fill[5..6].to_i(16)
      (red * 0.299 + green * 0.587 + blue * 0.114) > 186 ? '#000000' : '#FFFFFF'
    end

    # Upcase first letter of up to first two segments of the supplied name.
    def initials
      @name.split[0..1].map { |segment| segment[0] }.join('').upcase
    end
  end
end
