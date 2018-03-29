class HashClass
  require_relative 'hash_item'

  def initialize(size)
    @items = Array.new(size)
  end

   def []=(key, value)
    if @items[index(key, size)] === nil
       @items[index(key, size)] = HashItem.new(key, value)
    elsif @items[index(key, size)].key != key
      self.resize
      self[key]= value
    elsif @items[index(key, size)].key === key && @items[index(key, size)].value != value
      self.resize
      @items[index(key, size)].value = value
    end
  end
  
  def [](key)
    items_index = @items[index(key, size)]
    if !items_index.nil? and items_index.key === key
      return items_index.value
    end
  end


  def resize
    new_array = Array.new(size * 2)
    (0...size).each do |i|
      if @items[i] != nil
        new_index = @items[i].key.sum % new_array.length
        new_array[new_index] = @items[i]
      end
    end
    @items = new_array
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