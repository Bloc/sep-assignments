require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    idx = index(key, size)
    if @items[idx].nil?
      @items[idx] = Node.new(key, value)
    elsif @items[idx].key == key && @items[idx].value == value
      return
    else
      next_idx = next_open_index(idx)
      if next_idx == -1
        resize
        @items[index(key, size)] = Node.new(key, value)
      else
        new_idx = next_open_index(index(key, size))
        @items[new_idx] = Node.new(key, value)
      end
    end
  end

  def [](key)
    item = @items[index(key, size)]
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
    while @items[index]
      if index >= @items.length - 1
        return -1
      else
        index += 1
      end
    end
    return index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    current_size = size
    temp_array = Array.new(current_size * 2)
    @items.each do |item|
      if item
        key = item.key
        value = item.value
        new_idx = index(key, temp_array.size)
      end
    end
    @items = temp_array
  end

  def status
    @items.each do |item|
      if item
        idx = self.index(key, size)
        puts "Index: #{idx}, Key: #{item.key}, Value: #{item.value}"
      end
    end
  end
end
