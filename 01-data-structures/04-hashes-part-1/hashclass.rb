class HashClass
  require_relative 'hash_item'

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    #if nil adds new hash item
    if @items[index(key, @items.length)].nil?
      @items[index(key, @items.length)] = HashItem.new(key, value)
    #if the keys don't match, and out of room, resize 
    elsif @items[index(key, @items.length)].key != key
      self.resize
      self[key] = value
    #if there is a collision expand the array
    elsif @items[index(key, @items.length)].key === key && @items[index(key, @items.length)].value != value
      self.resize
      @items[index(key, @items.length)].value = value
    end
  end


  def [](key)
    item = @items[index(key, @items.length)]
    #if item is nil return nil, else return value of item
    item.nil? ? nil : item.value
  end

  def resize
    #takes size of hash and doubles it
    @size = @size * 2
    #creates new array, at a larger size and assigns it to variable
    doubled_hash = Array.new(@size)
    #goes through items and reassigns
    @items.each do |item|
      if item != nil
        doubled_hash[index(item.key, @size)] = item
      end
    end
    #makes @items equal to the new resized hash. 
    @items = doubled_hash
  
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end