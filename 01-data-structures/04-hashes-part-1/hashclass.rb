class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, size())

    if @items[i].nil? 
      @items[i] = item
    elsif @items[i].key != item.key
      self.resize
      self[key] = value # Recursive call to []=(key, value)
    elsif @items[i].value != item.value # values are different
      self.resize
      @items[index(item.key, size)] = value
    end
  end


  def [](key)
    i = index(key,size())
    if @items[i]
      @items[i].value
    end
  end

  def resize
    temp = @items.compact
    @items = Array.new(self.size * 2)
    temp.each{ |item| self[item.key] = item.value }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
      sum += c
    end
    sum = sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end