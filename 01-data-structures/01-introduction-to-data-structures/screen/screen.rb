require_relative 'pixel'

class Screen
  attr_reader :width
  attr_reader :height
  attr_reader :matrix

  def initialize(width, height)
	self.width = width
	self.height = height

	row = generate_row(width)
	self.matrix = Array.new(height, row)
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
	self.matrix[y[x]] = pixel
  end

  def at(x, y)
	if ((x || y) < 0)
		return nil
	end

	self.matrix[y[x]]
  end

  private

  def inbounds(x, y)
  end

  def generate_row(width)
		i = 0
		rowItems = []
		while i < width
			rowItems << [nil]
			i += 1
		end
		rowItems
  end
end