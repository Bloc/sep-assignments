# Pixels require three color values: red, green, and blue.
# Pixel colors red, green, and blue values must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
# Pixels also require a coordinate location: x and y.
class Pixel
  attr_accessor :red, :green, :blue, :x, :y

  def initialize(red, green, blue, x, y)
    @red = validate_color(red) || 255
    @green = validate_color(green) || 255
    @blue = validate_color(blue) || 255
    @x = x || 0
    @y = y || 0
  end

  private

  def validate_color(color)
    if 0 > color
      color = 0
    elsif color > 255
      color = 255
    end
  end

end