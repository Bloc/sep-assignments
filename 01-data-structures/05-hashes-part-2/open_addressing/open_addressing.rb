require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
    count = 0
  end

  def []=(key, value)
  end

  def [](key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
      key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    (index...@size).each do |i|
      if @items[i] == nil
        return i
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    doubled_ary = Array.new(@size *= 2)
    @items.compact.each do |i|
      doubled_ary[index(i.key, @size)] = i
    end
    @items = doubled_ary
  end
end
