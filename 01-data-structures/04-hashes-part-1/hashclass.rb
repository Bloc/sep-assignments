class HashClass

  i = index(key, size())

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)

    if @items[i] == nil
      @items[i] = HashItem.new(key,value)
    elsif @items[i].key != key
      self.resize
      self[key] = value
    elsif @items[i].key == key && @items[i] != value
      self.resize
      @items[i].value = value
    end
  end


  def [](key)
    @items[i].value
  end

  def resize
    @size = @size * 2
    resized_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
        resized_hash[index(item.key, @size)] = item
      end
    end
    @items = resized_hash
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
