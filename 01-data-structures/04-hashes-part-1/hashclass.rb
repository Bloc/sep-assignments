class HashClass
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    newHashItem = HashItem.new(key, value)
    newHashIndex = index(key, size)

    if @items[newHashIndex] == nil
      @items[newHashIndex] = newHashItem
    elsif @items[newHashIndex].key == key && @items[newHashIndex].value != value
      self.resize
    elsif @items[newHashIndex].key != key
      self.resize
      self.[]=(key, value)
    end
  end

  def [](key)
    newHashIndex = index(key, size)
    @items[newHashIndex].value
  end

  def resize
    oldItems = @items
    newLength = @items.length * 2
    @items = Array.new(newLength)

    oldItems.each do |item|
      self[item.key] = item.value unless item.nil?
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of
  # each string as a starting point.
  def index(key, size)
    indexValue = key.sum
    indexValue = indexValue % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
end
