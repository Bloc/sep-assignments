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


  def initialize(red = 0, green = 0, blue = 0, x = 0, y = 0)
    self.red = validate_color(red)
    self.green = validate_color(green)
    self.blue = validate_color(blue)
    self.x = x
    self.y = y
  end

  private

  def validate_color(value)
    return value if value >= 0 && value <= 255
    return 0 if value < 0
    return 255 if value > 255
  end

end
