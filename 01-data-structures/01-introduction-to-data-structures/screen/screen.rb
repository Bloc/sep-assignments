require_relative 'pixel'


class Screen
  attr_accessor :width #x
  attr_accessor :height #y
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width 
    self.height = height 
    self.matrix = []
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)

    if inbounds(x, y) 
      matrix.push({p: pixel, x: x, y: y})
    end 
  end

  def at(x, y)
    matrix.each do |pixel|
      x.eql?(pixel[:x]) && y.eql?(pixel[:y])
        return pixel[:p]
    end 
  end

  private

  def inbounds(x, y)
    if x <= width && y <= height 
      return true 
    end 
  end
end 
