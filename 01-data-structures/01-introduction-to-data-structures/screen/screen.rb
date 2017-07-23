require_relative 'pixel'

class Screen
    attr_accessor :width
    attr_accessor :height
    attr_accessor :matrix

    def initialize(width, height)
      @width = width
      @height = height
      @matrix = Array.new(width) { Array.new(height) } # 2d matrix of w * h
    end

    # Insert a Pixel at x, y
    def insert(pixel, x, y)
      if inbounds(x,y)
        matrix[x][y] = pixel
      end
    end

    def at(x, y)
      if inbounds(x,y)
        return matrix[x][y]
      else
        return nil
      end
    end

    private

    def inbounds(x, y)
      valid = true
      if((x < 0 || x > width - 1) || (y < 0 || y > height - 1))
        valid = false
      end
      return valid
    end
end

