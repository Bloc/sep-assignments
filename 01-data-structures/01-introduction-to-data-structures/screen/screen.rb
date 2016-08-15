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
    matrix << [x,y,pixel]
  end

  def at(x, y)
    matrix.each_with_index do |array, index|
      if matrix[index][0] == x && matrix[index][1] == y
        return matrix[index][2]
      end
    end
    nil
  end

  private

  def inbounds(x, y)
  end

end
