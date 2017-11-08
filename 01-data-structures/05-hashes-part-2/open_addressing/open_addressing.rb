require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.length)
    item = Node.new(key, value)
    if @items[i] == nil
      @items[i] = item
    else
      j = next_open_index(i)
      if j == -1
        resize
        self[key] = value
      else
        @items[j] = item
      end
    end
  end

  def [](key)
    i = index(key, @items.length)
    if @items[i].key != key
      result = @items.find { |a| a.key == key }
      return result.value
    else
      return @items[i].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total_ascii = 0

    key.each_byte do |k|
      total_ascii += k
    end

    return total_ascii % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    next_index = index

    if @items.length == 1 && @items[0] != nil
      return -1
    end

    while @items[next_index] != nil do
      next_index += 1
      if next_index >= (@items.length)
        next_index = -1
        break
      end
    end

    while @items[next_index] != nil do
      next_index += 1
      if next_index == index
        next_index = -1
        break
      end
    end
    return next_index
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    new_hash = Array.new(@items.length * 2)

    @items.each do |i|
      if i != nil
        new_hash[index(i.key, new_hash.length)] = i
      end
    end
    @items = new_hash
  end

  def print
    puts "\{"
    @items.each_with_index {|item, i|
      if item != nil
        puts "\t#{item.key}: #{item.value},"
      end
    }
    puts "\}"
  end
end
