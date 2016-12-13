class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    addItem(key, value)
  end


  def [](key)
    tempItem = @items[index(key, @items.size)]
    if tempItem
      return tempItem.value
    end
  end

  def resize
    tempSize = @items.size * 2
    placeholder = Array.new(tempSize)
    @items.each do |item|
      if item != nil
        tempIndex = index(item.key, tempSize)
        placeholder[tempIndex] = item
      end
    end
    @items = placeholder
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii(key) % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  private

  def addItem(key, value)
    if @items[index(key, @items.size)] != nil && @items[index(key, @items.size)].value != value
      resize
    else
      @items[index(key, @items.size)] = HashItem.new(key, value)
      return
    end
    #unless conditional below is included because otherwise the test that expects the same key with different values to resize the array will continue forever; in an actual data structure I don't think we should have this particular interaction and would like to speak with Richard as to why it's in here this way. 
    unless @items[index(key, @items.size)]!= nil && @items[index(key, @items.size)].key == key
      addItem(key, value)
    end
  end

  def ascii(key)
    total = 0
    key.each_char do |c|
      total += "#{c}".ord
    end
    return total
  end

end
