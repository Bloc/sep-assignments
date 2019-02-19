require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(self.width) { Array.new(self.height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    valid_coordinate = inbounds(x,y)
    self.matrix[x][y] = pixel if !valid_coordinate.nil?
  end

  def at(x, y)
    valid_coordinate = inbounds(x,y)
    self.matrix[x][y] if !valid_coordinate.nil?
  end

  private

  def inbounds(x, y)
    if (x < self.width && x >= 0) && (y < self.height && y >= 0)
      return x, y
    else
      nil
    end
  end

end
