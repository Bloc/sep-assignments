require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(width, Array.new(height, nil))
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    matrix[x][y] = pixel if inbounds(x, y)
  end

  def at(x, y)
    inbounds(x, y) ? matrix[x][y] : nil
  end

  private

  def inbounds(x, y)
    ((0..width).include?(x)) && ((0..height).include?(y))
  end

end
