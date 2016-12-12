require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    ind = index(key, @size)
    hashed_item = @items[ind]
    if hashed_item.nil?
      @items[ind] = Node.new(key, value)
    elsif hashed_item.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        re_index = index(key, @size)
        break if @items[re_index] == nil
      end
      self[key] = value
    elsif hashed_item.key == key && hashed_item.value != value
      if next_open_index(ind) == -1
        resize
        re_index = index(key, @size)
        @items[re_index].value = value
      else
        new_index = next_open_index(index(key, @size))
        @items[new_index] = value
      end
    end
  end

  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    int_index = index
    while index <= (@size -1)
      if @items[index] == nil
        return index
      elsif @items[index] != nil && index == (int_index - 1)
        return -1
      elsif @items[index] != nil && @items[index] == (@size -1)
        index = 0
      else
        index += 1
      end
    end
    -1
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
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
  def status
    load_factor = @items.compact.length.to_f / self.size.to_f
    puts "Load Factor: #{load_factor}"
    @items.inspect
        
    
  end
end