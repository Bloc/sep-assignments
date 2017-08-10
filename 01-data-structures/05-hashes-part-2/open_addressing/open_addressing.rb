require_relative 'node'

class OpenAddressing
  def initialize(size)
  end

  def []=(key, value) # assign the key-value pair
    item = HashItem.new(key, value) # make the key-value pair into an item

    i = self.index(key, self.size) # compute its index
    old_item = @items[i] # check if there is something already at that index
    
    if old_item == nil # nothing at that index, then
      @items[i] = item # stick it into the array
      @indices.push(i) # record that the index is not used
      return
    end

    until old_item == nil || old_item.key == item.key do # keep resizing until no collision
      i += 1 # recompute i
      old_item = @items[i] # recompute old item
    end
    
    if i > @items.length
      self.resize
      self[key] = value
      return
    end
    
    @items[i] = item # now that you've found an empty spot, put the item in it
    if old_item == nil # that means that we've increase the number of items
      @indices.push(i)
    end
  end

  def [](key)
    i = self.index(key, self.size) # compute its index
    old_item = @items[i] # check if there is something already at that index
    
    if old_item == nil # nothing at that index, then
      return nil
    end

    until old_item == nil || old_item.key == item.key do # keep resizing until no collision
      i += 1 # recompute i
      old_item = @items[i] # recompute old item
    end
    
    if i > @items.length
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
    value = ascii_value(key) % size
    return value
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    until @items[index] == nil do
      index = index + 1
    end
    return index
  end

  # Simple method to return the number of items in the hash
  def size
  end

  # Resize the hash
  def resize
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