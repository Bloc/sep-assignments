require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  #setter method
  def []=(key, value)
    i = index(key, @items.length)
    if @items[i].nil?
      @items[i] = HashItem.new(key, value)
    elsif @items[i].key != key
      self.resize
      self[key] = value
    elsif @items[i].key === key && @items[i].value != value
      self.resize
      @items[index(key, @items.length)].value = value
    end
  end

  #getter method
  def [](key)
    i = index(key, @items.length)
    if !@items[i].nil? and @items[i].key === key
      return @items[i].value
    end
  end

  def resize
    temp_items = @items
    @items = Array.new(temp_items.length * 2)
    temp_items.each do |pair|
      unless pair.nil?
        i = index(pair.key, @items.length)
        if @items[i].nil?
          self[pair.key] = pair.value
        elsif @items[i].key != key
          self.resize
          self[pair.key] = pair.value
        elsif @items[i] === key && @items[i].value != value
          self.resize
          @items[i].value = pair.value
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end
