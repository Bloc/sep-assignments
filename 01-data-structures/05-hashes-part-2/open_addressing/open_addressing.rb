require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    current_index = index(key, self.size)
    item = {key => value}
    if !@items[current_index].nil?
      next_index = next_open_index(current_index)
      if next_index == -1
        resize
        self.[]=(key, value)
      else
        @items[next_index] = item
      end
    else
      @items[current_index] = item
    end
  end

  def [](key)
    @items.each do |item|
      if item
        item.each do |item_key, value|
          if item_key == key
            return value
          end
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    current_index = index
    while !@items[current_index].nil?
      current_index += 1
      if current_index >= @items.length
        current_index = 0
      end
      if current_index == index
        return -1
      end
    end
    current_index
  end

  # Simple method to return the number of items in the hash
  def size
    counter = 0
    @items.each do |item|
      counter += 1
    end
    return counter
  end

  # Resize the hash
  def resize
    @items[@items.size * 2 - 1] = nil
    temp = []
    @items.each_with_index do |item, index|
      if !item.nil?
        temp.push(item)
        @items[index] = nil
      end
    end
    
    temp.each do |item|
      item.each do |key, value|
        index = index(key, @items.size)
        self.[]=(key, value)
      end
    end
  end
end
