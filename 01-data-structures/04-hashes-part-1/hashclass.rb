class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, size())

    if @items[i].nil? 
      @items[i] = item
    elsif @items[i].key != item.key #item already at the index and the keys dont match
                                    #i.e - index function created same index number buy the keys are not the same
      self.resize
      self[key] = value # Recursive call to []=(key, value)
    elsif @items[i].value != item.value # Keys are same but values are different
      self.resize
      @items[index(item.key, size)] = value
    end
  end


  def [](key)
    i = index(key,size())
    if @items[i]
      return @items[i].value
    end
  end

  def resize
    temp = @items.compact
    @items = Array.new(self.size * 2)
    return temp.each{ |item| self[item.key] = item.value }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
      sum += c
    end
    return sum = sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end