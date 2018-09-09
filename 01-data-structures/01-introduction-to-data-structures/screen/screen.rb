require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(width) {Array.new(height)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    @matrix[x][y] if inbounds(x, y)
  end

  private

  def inbounds(x, y)
    x <= @width && y <= @height
  end

end
