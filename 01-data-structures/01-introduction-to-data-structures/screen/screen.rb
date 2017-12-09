require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    width = width
    height = height
    self.matrix = Array.new(height){Array.new(width)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      matrix[y][x] = pixel
    end
  end

  def at(x, y)
    if inbounds(x, y)
      matrix[y][x]
    end
  end

  private

  def inbounds(x, y)
     x >= 0 && y >= 0
  end

end
