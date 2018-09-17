require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
	   i = index(key, @items.length)
     item = HashItem.new(key, value)
     if @items[i] == nil

     elsif @items[i].key == item.key && @items[i].value != item.value
       resize
     elsif @items[i].key != item.key
       resize
       self[key] = value
     end

     @items[i] = item
  end


  def [](key)
    i = index(key, @items.length)
	  @items[i].value
  end

  def resize
	   doubled_array = Array.new(@items.length*2)

     @items.each do |item|
       doubled_array[index(item.key, doubled_array.length)] = item if item != nil
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
    @items.length
  end

end
