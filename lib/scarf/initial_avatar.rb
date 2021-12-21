module Scarf
  class InitialAvatar
    def initialize(name, font_family: [], font_weight: nil, font_size: nil, background_shape: nil, background_colors: [])
      @name = name
      @font_family = font_family.length.zero? ? Scarf.configuration.font_family : font_family
      @font_weight = font_weight.nil? ? Scarf.configuration.font_weight : font_weight
      @font_size = font_size.nil? ? Scarf.configuration.font_size : font_size
      @background_shape = background_shape.nil? ? Scarf.configuration.background_shape : background_shape
      @background_colors = background_colors.length.zero? ? Scarf.configuration.background_colors : background_colors
    end

    def svg
      <<~WRAPPER.gsub(/$\s+/, '').strip
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 100 100">
          #{background}
          <text fill="#{foreground_fill}" font-size="#{@font_size}" font-weight="#{@font_weight}" font-family="#{quoted_fonts}" x="50" y="54" text-anchor="middle" dominant-baseline="middle" alignment-baseline="middle">#{initials}</text>
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
        index = (digest * (@background_colors.length - 1)).round
        @background_colors[index]
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
