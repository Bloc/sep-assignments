require_relative 'pixel'
require 'matrix'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Matrix.build(height, width) { 0 }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    matrix_temp = *@matrix
    matrix_temp[x][y] = pixel
    @matrix = Matrix[*matrix_temp]
  end

  def at(x, y)
    return nil unless inbounds(x, y)
    @matrix[x, y]
  end

  private

  def inbounds(x, y)
    return false if x < 0 || x >= @width || y < 0 || y >= @height
    true
  end

end
