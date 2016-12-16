require_relative 'pixel'
require 'matrix'
# found in order to manipulate indexes of matrixes
# http://stackoverflow.com/questions/15884376/ruby-2-0-how-to-access-element-in-matrix-by-coordinate
# monkey patch for matrix
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width;
    @height = height;
    self.matrix = Matrix.build(@width, @height) {|row, col| col = row }#self is defined as this ("screen") in this instance.
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[x,y] = pixel; # set matrix coordinate to pixel properties
  end

  def at(x, y)
     inbounds(x,y) == nil ? nil : matrix[x,y];
  end

  private

  def inbounds(x, y)
    if (x < 0 || y < 0)
       return nil
     else
       return x, y
     end
   end

end
