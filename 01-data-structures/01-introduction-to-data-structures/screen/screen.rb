require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width  = width
    @height = height
    @matrix = Array.new(height){Array.new(width)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y)
      @matrix[x][y] = pixel
    else
      nil
    end
  end

  def at(x, y)
    if inbounds(x,y)
      @matrix[x][y]
    else
      nil
    end
  end

  private

  def inbounds(x, y)
    if x < 0 || y < 0 || x > @width || y > @height
      nil
    else
      true
    end
  end
end
