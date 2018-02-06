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
    self.red = validate_color(red)
    self.green = validate_color(green)
    self.blue = validate_color(blue)
    self.x = x
    self.y = y
  end

  private

  def validate_color(color)
    if color < 0
      0
    elsif color > 255
      255
    else
      color
    end
  end
end
