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
      new_index = next_open_index(i)
      if new_index == -1
        resize
        self[key] = value
      else
        @items[new_index] = item
      end
    end
  end

  def [](key)
    i = index(key, @items.length)
    if @items[i].key != key
      item = @items.find {|item| item.key == key}
      item.value
    else
      @items[i].value
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
    new_index = nil

    for i in (index..@items.length-1) do
      if @items[i] == nil
        new_index = i
        break
      end
    end

    if new_index == nil
      for i in (0..index-1) do
        if @items[i] == nil
          new_index = i
          break
        end
      end
    end

    if new_index == nil
      new_index = -1
    end

    new_index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    doubled_array = Array.new(size*2)

    @items.each do |item|
      doubled_array[index(item.key, doubled_array.length)] = item if item != nil
    end

    @items = doubled_array
  end
end
