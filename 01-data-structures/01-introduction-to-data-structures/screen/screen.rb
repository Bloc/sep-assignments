require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @matrix = Array.new(width) { Array.new(height, 0) }
    @height = height
    @width = width
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    inbounds(x, y)
  end

  private

  def inbounds(x, y)
    if x > @width || y > @height || x < 0 || y < 0
      nil
    else
      @matrix[x][y]
    end

  end

end
