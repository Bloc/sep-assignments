require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width #columns
    @height = height #rows
    @matrix = Array.new(@height){Array.new(@width)}

    #1
    #You can declare a multidimensional array in Ruby with:
    #Array.new(Number_of_ROWs){Array.new(Number_of_COLUMNs)}
    #2
    #Array.new(n) {Array.new(n,default_value)}
    #Array.new(3) {Array.new(2,5)} => [[5, 5], [5, 5], [5, 5]]

  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    #return pixel if matrix[x][y] => pixel not defined
    inbounds(x,y)? @matrix[x][y] : nil
  end

  private

  def inbounds(x, y)
    #outbounds => return nil if x > width || y > height
    ((x <= width || x >= 0) || (y <= height || y >= 0))
  end

end