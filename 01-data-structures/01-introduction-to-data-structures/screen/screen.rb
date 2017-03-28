require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
      @width = width
      @height = height
      @matrix = Array.new(height){Array.new(width)}
  end

  def insert(pixel, x, y)
      @matrix[x][y] = pixel
  end

  def at(x, y)
      return @matrix[x][y]
  end

  private

  def inbounds(x, y)
      if @width < x
          return nil
      else
          return x
      end

      if @height < y
          return nil
      else
          return y
      end
  end

end
