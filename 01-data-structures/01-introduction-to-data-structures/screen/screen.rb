require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width #4
    self.height = height #3
    self.matrix = Array.new(height, Array.new(width, nil))
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[x][y] = pixel
  end

  def at(x, y)
    inbounds(x, y) ? matrix[x][y] : nil
  end

  private

  def inbounds(x, y)
    ((x < height && x > 0) && (y < width && y > 0))
  end

end
