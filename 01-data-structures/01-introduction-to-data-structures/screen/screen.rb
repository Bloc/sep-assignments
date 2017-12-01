require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix


  def initialize(width, height)
    @width = width
    @height = height
    @matrix = []
    @matrix = Array.new(height) { Array.new(width) }
    # @height.times do |h|
    #   @matrix[h] ||= []
    #   @width.times do |w|
    #     @matrix[h][w] = []
    #   end
    # end
  end

  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    return @matrix[x][y] if inbounds(x,y)
  end

  private

  def inbounds(x, y)
    return false if (x < 0) || (x > @width)
    return false if (y < 0) || (y > @height)
    true
  end

end
