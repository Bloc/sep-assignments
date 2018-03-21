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
    self.matrix.push({pixel: pixel, x: x, y: y})
  end

  def at(x, y)
    if inbounds(x, y) == true
      self.matrix.each do |e|
        if e.has_value(x) && e.has_value(y)
          return e[:pixel]
        else
          nil
        end
      end
    end
  end

  private

  def inbounds(x, y)
    ((x < 0 || x > width) || (y < 0 || y > height)) ? nil : true
  end

end
