# Pixels require three color values: red, green, and blue.
# Pixel colors red, green, and blue values must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
# Pixels also require a coordinate location: x and y.

class Pixel
  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue
  attr_accessor :x
  attr_accessor :y


  def initialize(red, green, blue, x, y)
		pixel.red = red
		pixel.green = green
		pixel.blue = blue
		pixel.x = x
		pixel.y = y
		
		if pixel.red < 0
			pixel.red = 0
		end
		
		if pixel.green < 0
			pixel.green = 0
		end
		
		if pixel.blue < 0
			pixel.blue = 0
		end
		
		if pixel.red > 255
			pixel.red = 255
		end
		
		if pixel.green > 255
			pixel.green = 255
		end
		
		if pixel.blue > 255
			pixel.blue = 255
		end
		
  end

  private

  def validate_color(color)
  end

end
