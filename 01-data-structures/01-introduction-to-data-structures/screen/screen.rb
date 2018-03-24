require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width =  width
    self.height = height
    self.matrix = Array.new(height) {Array.new(width)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[x][y] = pixel 
  end

  def at(x, y)
    if inbounds(x, y)
      self.matrix[x][y]
    else
      nil
    end
  end

  private

  def inbounds(x, y)
    if x > 0 && x < self.width && y > 0 && y < self.height
      true
    else
      false
    end
  end

end