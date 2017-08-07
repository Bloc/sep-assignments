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
    @red = validate_color(red)
    @green = validate_color(green)
    @blue = validate_color(blue)
    @x = x
    @y = y
  end

  private

  def validate_color(color)
    if color < 0 
      color = 0
    elsif color > 255
      color = 255
    end
    return color
  end

end
