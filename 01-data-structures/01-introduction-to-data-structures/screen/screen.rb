require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
		self.width = width
		self.height = height
		self.matrix = []
		while self.matrix.length < width
			row = Array.new(height)
			self.matrix.push row
		end
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
		if inbounds(x, y)
			self.matrix[x][y] = pixel
		end
  end

  def at(x, y)
		if inbounds(x, y)
			return self.matrix[x][y]
		else
			return nil
		end
  end

  private

  def inbounds(x, y)
		if x < 0 && x > self.width
			return false
		elsif y < 0 && y > self.height
			return false
		else
			return true
		end
  end

end
