require 'prime'
require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key, size)

    if @items[index] == nil
      @items[index] = Node.new(key, value)
    elsif next_open_index(0) == -1
      resize
      self[key] = value
    else
      index = next_open_index(index)
      if index == -1
        resize
        self[key] = value
      elsif @items[index] == nil
        @items[index] = Node.new(key, value)
      end
    end
  end

  def [](key)
    index = 0
    # puts "--------------------"
    # p @items
    # p index(key, size)
    until index == size
      if @items[index] == nil
        index += 1
      elsif @items[index].key == key
        return @items[index].value
      else
        index += 1
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
      if index === size
        return -1
      end
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    resized_hash = Array.new(size * 2)

    @items.each do |i|
      if i != nil
        resized_hash[index(i.key, size)] = i
      end
    end
    @items = resized_hash
  end

  def print_hash
    p @items
  end

end
