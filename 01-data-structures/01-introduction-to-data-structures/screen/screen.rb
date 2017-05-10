require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = {}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    inbounds(x,y)
    matrix[pixel] = [x, y]
  end

  def at(x, y)
    @matrix.key( [x, y] )
  end

  private

  def inbounds(x, y)
    if ((x > 0) && (x < @width))
      x
    else
      x = nil
    end

    if ((y > 0) && (y < @height))
      y
    else
      y = nil
    end
  end
end
