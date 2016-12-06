require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(height) {Array.new(width)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    matrix[y][x] = pixel
  end

  def at(x, y)
    if inbounds(x, y) == true
      return matrix[y][x]
    else
      return nil
    end
  end

  private

  def inbounds(x, y)
    if x > 0 && x < self.width && y > 0 && y < self.height
      return true
    else
      return false
    end
  end

end
