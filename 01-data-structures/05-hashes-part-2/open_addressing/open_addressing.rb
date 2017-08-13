require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @indices = [] # I'm sure if this is helpful, but this is a list of the nonnull indices.
  end
  
  
  def insert(item) 
    key = item.key
    i = self.index(key, self.size) # compute its index
    old_item = @items[i] # check if there is something already at that index
    
    if old_item
      if next_open_index(i) < 0
        resize
        i = self.index(key, self.size) # compute its index
        old_item = @items[i] # check if there is something already at that index
      end
    end

    until old_item == nil || old_item.key == item.key do # find first free index
                                                        # or exact match of key
      i += 1 # recompute i
      old_item = @items[i] # recompute old item
    end
    
    @items[i] = item # now that you've found the right index, put the item in it
    if old_item == nil # that means that we've increase the number of items
      @indices.push(i)
    end
    print_state
  end

  def []=(key, value) # assign the key-value pair
    item = Node.new(key, value) # make the key-value pair into an item
    self.insert(item)
  end

  def [](key)
    puts @items.length
    i = self.index(key, self.size) # compute its index
    old_item = @items[i] # check if there is something already at that index
    
    if old_item == nil # nothing at that index, then
      return nil
    end

    until old_item == nil || old_item.key == key do # keep resizing until no collision
      i += 1 # recompute i
      old_item = @items[i] # recompute old item
    end
    
    if i == @items.length
      return nil # past the end of the array
    end
    
    if old_item
      return old_item.value
    end

    return nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return ascii_value(key) % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(i)
    until @items[i] == nil do
      i += 1
    end
    if i >= @items.length
      return -1
    end
    return i
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  def resize # get a double-sized array, and copy elements into it
    tmp_arr = @items # save the current items
    tmp_indices = @indices # save the indices

    @items = Array.new(self.size*2) # create a new array that is twice the size
    @indices = [] # initially, it's empty
    tmp_indices.each do |i| # go through the nonempty elements of the old array
      item = tmp_arr[i] 
      self.insert(item) # put them in the proper spot
    end
  end
  
  
  def load_factor # Number of items divided by amount of available spots (in percent)
    return (100 * @indices.length)/@items.length 
  end
  
  def print_state
    retval = "(LF: #{load_factor}%) "
    @items.each do |item|
      if item == nil
        retval += "."
      else
        retval += "[#{item.label}]"
      end
    end
    puts retval
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