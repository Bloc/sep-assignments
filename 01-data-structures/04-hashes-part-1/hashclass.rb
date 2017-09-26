class HashClass
  require_relative 'hash_item'

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    hash = @items[index(key, @size)]

    if hash.nil?
      @items[index(key, @size)] = HashItem.new(key, value)
    elsif !hash.key.eql?(key)
      self.resize
      self[key] = value
    elsif hash.key.eql?(key) && !hash.value.eql?(value)
      self.resize
      hash.value = value
    end
  end


  def [](key)
    i = @items[index(key, @size)]

    if i != nil
      i.value
    else
      nil
    end
  end

  def resize
    @size = @size * 2
    doubled_array = Array.new(@size)
    @items.compact.each do |item| 
      if !item.nil?
        doubled_array[index(item.key, @size)] = item
      end
    end
    @items = doubled_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end
