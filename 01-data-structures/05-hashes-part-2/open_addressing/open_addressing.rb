require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    index = index(key, @size)
    node = Node.new(key, value)
    while @items[index]
      index = next_open_index(index)
      if index == -1
        resize
        self[key] = value
        return
      end
    end
    @items[index] = node
  end

  def [](key)
    index = index(key, @size)
    while key != @items[index].key
      index += 1
    end
    return @items[index].value
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
      return -1 if index == @size
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    old_arr = @items
    @size *= 2
    @items = Array.new(@size)
    old_arr.each do |item|
      next unless item
      self[item.key] = item.value
    end
  end

  def state
    index = 0
    counter = 0.0
    @items.each do |item|
      if item
        puts "index #{index}:"
        puts "key: #{item.key} -- value: #{item.value} -- memory: #{item.object_id}"
        counter += 1
      else
        puts "index #{index} is nil"
      end
      index += 1
    end
    puts "load factor: #{counter / @size}"
    return
  end
end