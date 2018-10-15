class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index_val = index(key, size)
    new_item = @items[index_val]

    if new_item == nil
      @items[index_val] = HashItem.new(key, value)
    elsif new_item.key != key
      while @items[index(key, size)].key != nil && @items[index(key, size)].key != key
        resize
        i = index(key, size)
        break if @items[i] == nil
      end
      self[key] = value
    elsif new_item.key == key && new_item.value != value
      resize()
      new_item.value = value
    end
  end


  def [](key)
    index_val = index(key, size)
    @items[index_val].value
  end

  def resize
    resized_hash = @items += Array.new(size)
    
    @items.each do |i|
      if i != nil
        resized_hash[index(i.key, size)] = i
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
