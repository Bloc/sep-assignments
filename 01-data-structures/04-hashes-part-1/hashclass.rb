require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.length)
    item = HashItem.new(key, value)
    if @items[i] != nil && @items[i].key == item.key && @items[i].value != item.value
      resize
    end
    if @items[i] != nil && @items[i].key != item.key
      resize
      self[key] = value
    else
      @items[i] = item
    end
    puts self.size
  end


  def [](key)
    i = index(key, @items.length)
    return @items[i].value
  end

  def resize
    new_hash = Array.new(@items.length * 2)

    @items.each do |i|
      if i != nil
        new_hash[index(i.key, new_hash.length)] = i
      end
    end

    @items = new_hash
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total_ascii = 0

    key.each_byte do |k|
      total_ascii += k
    end

    return total_ascii % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end
