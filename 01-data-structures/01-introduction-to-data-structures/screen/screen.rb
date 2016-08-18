require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    #create matrix array to hold x,y coordinates and pixel
    @matrix = []
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    #insert pixel, x, y into matrix array
    matrix.push(pixel, x, y)
  end

  def at(x, y)
    #use bloc to iterate through array and determine if x,y have coordinates and if so, return pixel
    matrix.each_with_index do |array, index|
      #if element at 0 position equals x and 1 position equals y, then return pixel color
      if matrix[index][0] == x && matrix[index][1] == y
        return matrix[index][2]
      else
        #if x,y are not available, nothing to return
        return nil
      end
    end
  end

  private
  def inbounds(x, y)
  end

end
