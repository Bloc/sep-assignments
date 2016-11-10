require_relative 'pixel'
require 'matrix'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height

    # @matrix = Matrix.build(@width, @height) { |row, col| }
    @matrix = Array.new(@width) { Array.new(@height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      # @matrix[x, y] = pixel
      @matrix[x][y] = pixel
    end
  end

  def at(x, y)
    if inbounds(x, y)
      # return @matrix[x, y]
      return @matrix[x][y]
    end
  end

  private

  def inbounds(x, y)
    # if pixel is within screen area, it is inbounds
    if ((x > 0) && (x <= @width)) && ((y > 0) && (y <= @height))
      return true
    else
      return false
    end
  end

end
