require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    screen = Array.new(width) {Array.new(height)}
    @screen = screen


  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @screen[x][y] = pixel

  end

  def at(x, y)
    @screen[x][y]
  end

  private

  def inbounds(x, y)
  end

end
