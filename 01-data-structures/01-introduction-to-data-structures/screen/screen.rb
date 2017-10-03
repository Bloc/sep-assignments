require_relative 'pixel'
require 'matrix'

class Matrix  
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Matrix.zero(height, width)
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x, y] = pixel
  end

  def at(x, y)
    inbounds(x,y)
  end

  private

  def inbounds(x, y)
    @matrix[x,y] == 0 ? nil : @matrix[x,y]
  end

end