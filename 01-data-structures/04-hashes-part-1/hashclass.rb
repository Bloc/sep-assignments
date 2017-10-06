class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    code = key.is_a?(Numeric) ? key : index(key, @size)
    if @items[code].nil? || @items[code][1] == value
      @items[code] = [key, value]
    elsif key == @items[code][0]
      @items[code] << value
    else
      resize
      self[key] = value
    end
  end

  def [](key)
    code = index(key, @size)
    @items[code][1]
  end

  def resize
    @size *= 2
    oldArr = @items
    @items = Array.new(@size)
    oldArr.each do |item|
      next unless item
      code = index(item[0], @size)
      @items[code] = item
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    counter = 0
    @items.each do |item|
      if item.nil?
        counter += 1
      else
        counter += item.length - 1
      end
    end
    counter
  end

end