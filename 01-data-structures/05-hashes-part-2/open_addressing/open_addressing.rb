require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
    count = 0
  end

  def []=(key, value)
    i = index(key, @size)
    hash = @items[index(key, @size)]

    if hash == nil
      hash = Node.new(key, value)
      count += 1
    elsif hash.key == key && hash.value == value
      return
    elsif hash.key == key && hash.value != value
      hash.value = value
    else
      next_open = next_open_index(i)

      if next_open == -1
        resize
        self.key = value
      else
        @item[i] = Node.new(key, value)
        count += 1
      end
    end
  end

  def [](key)
    i = @items[index(key, @size)]

    if i != nil
      i.value
    else
      nil
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

  def load_factor
    j = 0.to_f

    (0...@size).each do |i|
      if @items[i]
        j += 1
      end
    end
    j / @size
  end
  
end
