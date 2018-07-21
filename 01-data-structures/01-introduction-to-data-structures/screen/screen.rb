require_relative 'pixel'
require 'pp'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = []
    for column in 0...height
      @matrix.push([])
      for row in 0...width
        @matrix[column].push(Pixel.new(0,0,0,row, column))
      end
    end
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      matrix[x][y]= pixel
    end
  end

  def at(x, y)
    if inbounds(x, y)
      matrix[x][y]
    else
      return nil
    end
  end

  private

  def inbounds(x, y)
    (x>=0 && x < width) && (y>=0 && y < height)
  end

end
