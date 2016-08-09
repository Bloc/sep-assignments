require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = []
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      @matrix << [pixel, x, y]
    else
      @matrix << [nil, x, y]
    end
  end

  def at(x, y)
    if inbounds(x,y)
     @matrix.each do |pix, xcord, ycord|
       if (xcord == x) && (ycord = y)
         return pix
       end
     end
   end
  end

  private

  def inbounds(x, y)
    if ((x < 0) || (y < 0) || (x > width) || (y > height))
      return false
    else
      return true
    end
  end

end
