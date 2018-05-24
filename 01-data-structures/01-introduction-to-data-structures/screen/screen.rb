require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(height){Array.new(width){Array.new(5){|index| 0}}}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    inbounds(x,y)
  end

  private

  def inbounds(x, y)
    if x < 0 || y < 0
      return nil
    end
    @matrix[x][y]
  end

end
