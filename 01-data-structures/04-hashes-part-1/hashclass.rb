class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i]
      if @items[i].key == key
        @items[i].value = value
      else
        resize
        self[key] = value
      end
    else
      @items[i] = HashItem.new(key, value)
    end
    puts(size, "#@items")
  end


  def [](key)
    item = @items[index(key, size)]
    if item && item.key == key
      item.value
    end
  end

  def resize
    old_items = @items
    @items = Array.new(size * 2)
    old_items.each { |item|
      if item
        i = index(item.key, size)
        while @items[i]
          resize
        end
        @items[i] = item
      end
    }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    hash = 0
    key.each_byte { |b|
      hash += b
    }
    hash % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

end
