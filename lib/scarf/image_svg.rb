module Scarf
  class ImageSVG
    def initialize(width, height, opt = {})
      @transparent = !!opt[:transparent]
      @mask = @transparent ? 'mask="clip"' : ''
      @masks = ''
      @image = ''
      @width = width
      @height = height
      @head = %(<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 #{width} #{height}">\n)
    end

    def color(r, g, b)
      'rgb(%d, %d, %d)' % [r, g, b]
    end

    def fill_rect(x, y, _x, _y, color)
      @image << %(<rect x="#{x}" y="#{y}" width="#{_x - x}" height="#{_y - y}" fill="#{color}" stroke-width="0" stroke="white" mask="url(#clip)"/>\n)
    end

    def polygon(points, color)
      unless points.empty?
        ps = points.map { |i| i.join(',') }.join(' ')
        @image << %(<polygon points="#{ps}" stroke-width="0" fill="#{color}" mask="(#clip)"/>\n)
      end
    end

    def polygon_clip(points)
      unless points.empty?
        ps = points.map { |i| i.join(',') }.join(' ')
        @masks << %(<polygon points="#{ps}" stroke-width="0"/>\n)
      end
    end

    def write(path)
      open(path, 'wb') { |f| f.write self.to_blob }
    end

    def to_blob
      if @transparent
        @head + build_mask + @image + "\n</svg>"
      else
        @head + @image + "\n</svg>"
      end
    end

    private

    def build_mask
      <<~MASK
        <mask id="clip" maskUnits="userSpaceOnUse" x="0" y="0" width="#{@width}" height="#{@height}">
          <g fill="black" fill-rule="evenodd">
            <rect x="0" y="0" width="#{@width}" height="#{@height}" fill="white"/>
            #{@masks}
          </g>
        </mask>
      MASK
    end
  end
end
