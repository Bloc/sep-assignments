require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height

    self.matrix = Array.new(@width) { Array.new(@height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y)
      matrix[x-1][y-1] = pixel
    end
  end

  def at(x, y)
    if inbounds(x,y)
      matrix[x-1][y-1]
    end
  end

  def search(pixel)
    instances_of_pixel = []
    matrix.each_with_index do |height_array, width_index|
      height_array.each_with_index do |element, height_index|
        if (element &&
            element.red == pixel.red &&
            element.green == pixel.green &&
            element.blue == pixel.blue)
          instances_of_pixel << [width_index + 1, height_index + 1]
        end
      end
    end
    instances_of_pixel
  end

  private

  def inbounds(x, y)
    (x >= 1 && x <= @width) && (y >= 1 && y <= @height)
  end
end
