require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  #setter method
  def []=(key, value)
    # #set array
    # #set key to value
    # #calculate index
    # index = self.index(key, size)
    # #check if hash element is already defined in @items array
    # if @items[index]
    #   @items[index] = HashItem.new(key, value)
    # #check if key/value already exist
    # elsif
    # #if both key and value are the same do nothing
    # #call resize
    # else
    # #if neither conditions match, call resize, assign value to key
    # end
  end

  #getter method
  def [](key)
    #get index
    #if item from index exists then we return hash element value
  end

  def resize
    #create temp_items variable to hold @items
    #define new items with new size
    #similar conditions to def []=(key, value)
    #assign elements from temp_items to new @items
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
