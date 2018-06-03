require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key,value)
    hash_index = index(key,size)
    if @items[hash_index].nil?
      @items[index(key,size)] = node
    else
      new_index = self.next_open_index(hash_index)
      if new_index == -1
        self.resize
      else
        @items[new_index] = node
      end
    end
  end

  def [](key)
    hash_index = index(key,size)
    if @items[hash_index].key == key
      return @items[hash_index].value
    else
      1.upto(size-1) do |i|
        new_index = (hash_index + i * i) % size
       if @items[new_index].key == key
          return @items[new_index].value
       end
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
    1.upto(size-1) do |i|
      new_index = (index + i * i) % size
      if @items[new_index].nil?

        return new_index
      end
    end

    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp_items = @items
    @items = Array.new(2 * size)
    temp_items.each do |node|
      if node
        @items[index(node.key, size)] = node
      end
    end
  end
end
