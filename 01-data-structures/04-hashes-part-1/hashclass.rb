class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = @items[index(key, size)]
    if item.nil?
      item = HashItem.new(key, value)
    elsif item.key != key
      @items.resize
      @items[key] = value
    elsif item.key == key && item.value != value
      @items.resize
      item.value = value
    end
  end


  def [](key)
    item = @items[index(key, size)]
    if item != nil && item.key == key
      item.value
    end
  end

  def resize
    current_size = size
    temparray = Array.new(current_size * 2)
    @items.each do |t|
      if t
        key = t.key
        value = t.value
        new_index = index(key, temparray.length)
      end
    end
    @items = temparray
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

end
