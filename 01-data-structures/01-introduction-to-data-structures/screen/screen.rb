require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(@width) { Array.new(@height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)?
      return @matrix[x][y] = pixel
    else
      nil
  end

  def at(x, y)
    if inbounds(x, y)?
      return @matrix[x][y]
    else
      nil
  end

  private

  def inbounds(x, y)
    (x < 0 || y < 0) ? nil : true
  end

end