require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = [width, [height, nil]]
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    if inbounds(x, y)
      @matrix[x][y]
    else
      return nil
    end
  end

  private

  def inbounds(x, y)
    ((x < width || x >= 0) && (y < height || y >= 0))
  end

end