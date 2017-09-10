require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = self.index(key, self.size)

    if self.next_open_index(i) == -1 #loop has grown past index size
      resize
    end

    if @items[i] == nil 
      @items[i] = node
    elsif @items[i].key == key #same key ovveride the value
      @items[i].value = value
    else # collision due to the same index value
      n = self.next_open_index(i)
      if n != -1
        @items[n] = node
      else
        resize #reassign nodes to new indicies
        self[key] = value # assigning "node" to a nil location
      end
    end
  end

  def [](key)
    i = self.index(key, size)
    while i < size
      if @items[i].key == key
        return @items[i].value #return the value based on matched key
      else #else incriment index if not found 
        i += 1 
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index += 1
    end
    if index >= self.size
      return -1
    else
      return index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items.compact

    @items = Array.new(self.size * 2)
    temp.each { |node| self[node.key] = node.value }
  end
end