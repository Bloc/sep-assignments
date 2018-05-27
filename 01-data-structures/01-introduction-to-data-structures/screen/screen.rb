require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.matrix = Array.new(width){Array.new(height){ nil }}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    pixel.x = x
    pixel.y = y
    matrix[x][y] = pixel
  end

  def at(x, y)
    if x > 0 && y > 0
      matrix[x][y]
    else
      nil
    end
  end

  private

  def inbounds(x, y)
  end

end
