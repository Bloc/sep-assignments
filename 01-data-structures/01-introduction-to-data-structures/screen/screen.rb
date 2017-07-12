require_relative 'pixel'

class Screen
  attr_accessor :width, :height, :matrix

  def initialize(width, height)
    @matrix = Array.new(width){Array.new(height)}
  end

  # Insert a Pixel at x, y
  def insert(pixel)
    @matrix[pixel.x][pixel.y] = pixel
  end

  def at(x, y)
    @matrix[x][y]
  end

  def show_matrix
    str = ""

    @matrix.each do |x|
      x.each {|xy| str << "[#{xy.red}, #{xy.green}, #{xy.blue}]"}
      str << "\n"
    end

    return str
  end

  private

  def inbounds(x, y)
  end

end
