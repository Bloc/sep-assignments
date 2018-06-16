class HashClass



  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size())
    new_item = @items[i]
    if new_item == nil
      @items[i] = HashItem.new(key,value)
    elsif new_item.key != key
      while @items[index(key, size())].key != nil && @items[index(key, size())].key != key
        resize()
        j = index(key, size())
        break if @items[j] == nil
      end
      self[key] = value
    elsif new_item.key == key && new_item.value != value
      resize()
      new_item.value = value
    end
  end


  def [](key)
    i = index(key, size())
    @items[i].value
  end

  def resize
    @size = @items.length * 2
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
