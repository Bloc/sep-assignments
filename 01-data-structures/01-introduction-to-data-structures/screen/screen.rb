require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
		@width = width
		@height = height
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
		pixel.new(width.value, height.value)
  end

  def at(x, y)
		x = width.value 
		y = height.value
		
		if x < 0 || y < 0
			pixel.at = nil
		end
  end

  private

  def inbounds(x, y)
  end

end