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
    temp = @items
    @items = Array.new(temp.size * 2)
    temp.each do |t|
      if t != nil
        @items[index(t.key, size)] = t
      end
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
    @items.length
  end

end
