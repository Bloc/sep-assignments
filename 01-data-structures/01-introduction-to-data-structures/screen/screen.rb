require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(width) { Array.new(height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      @matrix[x][y] = pixel
    end
  end

  def at(x, y)
    @matrix[x][y]
  end

  private

  def inbounds(x, y)
    valid = true;
    if x < 0 || x > @width-1
      puts "x value is out of bounds"
      valid = false
    end
    if y < 0 || y > @height-1
      puts "y value is out of bounds"
      valid = false
    end
    return valid
  end

end
