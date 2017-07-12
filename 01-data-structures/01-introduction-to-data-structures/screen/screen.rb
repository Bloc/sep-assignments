require_relative 'pixel'

class Screen
  attr_reader :width, :height

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

  # I probably wouldn't bother to do this that often, but this is a way to
  # prevent mutation on 2D arrays, since `clone` is too shallow.
  def matrix
    cloned_matrix = Array.new(@matrix.length){Array.new(@matrix[0].length)}
    for x in 0..(@matrix.length - 1) do
      for y in 0..(@matrix[x].length - 1) do
        cloned_matrix[x][y] = @matrix[x][y]
      end
    end
    return cloned_matrix
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
