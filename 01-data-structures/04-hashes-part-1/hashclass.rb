require_relative 'hash_item'
class HashClass

  def initialize(size)
    @items = Array.new(size)
    @indices = [] # I'm sure if this is helpful, but this is a list of the nonnull indices.
  end

  def []=(key, value) # assign the key-value pair
    item = HashItem.new(key, value) # make the key-value pair into an item

    i = self.index(key, self.size) # compute it's index
    old_item = @items[i] # check if there is something already at that index
    
    if old_item == nil # nothing at that index, then
      @items[i] = item # stick it into the array
      @indices.push(i) # record that the index is not used
      print_state
      return
    end

    until old_item == nil || old_item.key == item.key do # keep resizing until no collision
      self.resize
      i = self.index(key, self.size) # recompute i after resize
      old_item = @items[i] # recompute old item
    end
    
    @items[i] = item # now that you've found an empty spot, put the item in it
    
    if old_item == nil # that means that we've increase the number of items
      @indices.push(i)
    elsif old_item.value != item.value
      self.resize # absolutely no reason for this, except the spec calls for it
    end
    
    print_state
  end

  def [](key) # look up the value associated with this key
    i = self.index(key, self.size) # compute the index
    item = @items[i]
    if item && item.key == key
      return item.value
    end
    return nil
  end
  
  def print_state
    puts ""
    retval = "<"
    @items.each do |item|
      if item
        retval += "(#{item.key}:#{item.value})"
      else
        retval += '.'
      end
    end
    retval += ">"
    puts retval
    puts ""
  end

  def resize # get a double-sized array, and copy elements into it
    tmp_arr = @items # save the current items
    tmp_indices = @indices # save the indices

    @items = Array.new(self.size*2) # create a new array that is twice the size
    @indices = [] # initially, it's empty
    tmp_indices.each do |i| # go through the nonempty elements of the old array
      item = tmp_arr[i] 
      self[item.key] = item.value # put them in the proper spot
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    value = ascii_value(key) % size
    return value
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end
  
  private
  def ascii_value(s) # add up the ascii values of all the characters in the string
    value = 0
    chars = s.split('')
    chars.each do |c|
      value += c.ord
    end
    return value
  end
end