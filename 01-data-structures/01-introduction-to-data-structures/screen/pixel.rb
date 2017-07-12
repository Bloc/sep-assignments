# Pixels require three color values: red, green, and blue.
# Pixel colors red, green, and blue values must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
# Pixels also require a coordinate location: x and y.

class Pixel
  attr_reader :red, :green, :blue, :x, :y

  def initialize(red, green, blue, x, y)
    @red = validate_color(red)
    @green = validate_color(green)
    @blue = validate_color(blue)
    (x.is_a? Integer) ? @x = x : @x = 0
    (y.is_a? Integer) ? @y = y : @y = 0
  end

  def update_color(r, g, b)
    return nil unless (r.is_a? Integer) && (g.is_a? Integer) && (b.is_a? Integer)
    @red = validate_color(r)
    @green = validate_color(g)
    @blue = validate_color(b)
  end

  def update_position(x, y)
    return nil unless (x.is_a? Integer) && (y.is_a? Integer)
    @x = x
    @y = y
  end

  private

  def validate_color(color)
    return 0 unless color.is_a? Integer

    if color > 255
      255
    elsif color < 0
      0
    else
      color
    end
  end

end
