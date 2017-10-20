require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = []
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y) == false
      return "Out of Bounds"
    else
      point = [pixel,x,y]
      matrix.push(point)
    end
  end

  def at(x, y)
    if inbounds(x,y) == false
      return
    else 
      i = 0
      while i< matrix.length
      if matrix[i][1] == x && matrix[i][2] == y
        return matrix[i][0]
      else
        i+=1
      end
      end
    end
  end

  private

  def inbounds(x, y)
    if x <0 || y< 0
      return false
    elsif x > width || y > height
      return false
    else 
      return true
    end
  end

end