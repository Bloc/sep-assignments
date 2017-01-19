class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = self.index(key, size)
    
    while (@items[index] != nil) && (@items[index].value != value)
      self.resize
    end
    
    @items[index] = HashItem.new(key, value)

    puts "Hash: #{@items}"
    puts "Size: #{@items.size}"
  end


  def [](key)
    index = self.index(key, size)
    @items[index].value
  end

  def resize
    arr = @items
    @items = Array.new(size * 2)
    
    for item in arr do
      if item 
        index = index(item.key, size)
        @items[index] = item
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