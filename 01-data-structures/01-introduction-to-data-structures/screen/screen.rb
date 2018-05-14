require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.matrix = Array.new(height){Array.new(width)}
  end
  
  def insert(pixel, x, y)
    self.matrix[x][y] = pixel
  end

  def at(x, y)
    return self.matrix[x][y]
  end

  private

  def inbounds(x, y)
  end

end