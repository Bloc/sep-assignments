require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    #create an array within an array to hold [x[y]]
    @matrix = Array.new(@width) {Array.new(@height)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    #if x,y meet inbounds method requirements, then a pixel can be inserted
    if inbounds(x,y)
      return @matrix[x][y] = pixel
    end
  end

  def at(x, y)
    if inbounds(x,y)
      #returns the valid x,y values
      return @matrix[x][y]
    end
  end

  private
  #define what x and y must be
  #screen has width and height..x must be less/equal to width and y <= height
  #initially used width and height before realizing @width and @height, also had > instead of <=
  #x and y are both integers
  def inbounds(x, y)
    ((x > 0) && (x <= @width)) && ((y > 0) and (y <= @height))
  end

end
