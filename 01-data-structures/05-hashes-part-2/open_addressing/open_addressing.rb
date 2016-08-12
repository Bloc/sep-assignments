require_relative 'node'
require 'pry'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    index = index(key, @items.size)
    node = Node.new(key, value)

    if @items[index] == nil
      @items[index] = node
      @item_count += 1
    else
      open_index = next_open_index(index)
      if open_index == -1
        self.resize
      return
      else
        @items[open_index] = node
        @item_count += 1
      end
    end
  end

  def [](key)
    index = self.index(key, self.size)
    if @items[index] != nil
      if @items[index].key == key
        @items[index].value
      else
        key = @items[index].value
      end
    end
  end


  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0

    key.split("").each do |char|
      if char.ord == 0
        next
      end
      sum = sum + char.ord
    end
    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    count = index
    while @items[count] != nil
      if count == @items.size - 1
        return -1
      else
        count += 1
      end
    end
    return count
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    old_items = @items
    @items = Array.new(@items.size * 2)
    old_items.each do |item|
      if item != nil
        index = self.index(item.key, self.size)
        if @items[index] != nil
          self[item.key] = item.value
        else
          @items[index] = item
        end
      end
    end
  end
end
