require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
   unique_index = index(key, @size)#calling the method!
   hashed_item = @items[unique_index]#created the Hash with the Unique Index!

    if hashed_item.nil?
    @items[unique_index] = Node.new(key, value)
    elsif hashed_item.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        re_index = index(key, @size)
        break if @items[re_index] == nil
      end
      self[key] = value
    elsif hashed_item.key == key && hashed_item.value != value
      if next_open_index(unique_index) == -1
        resize
        re_index = index(key, @size)
        @items[re_index].value = value
      else
        new_index = next_open_index(index(key, @size))
        @items[new_index] = value
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
    until (@items[index].nil?) || (index > size - 1)
      index += 1
    end
    index = -1 if index > size - 1
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size = @size * 2
    expanded_hash = Array.new(@size)

    @items.each do |item|
      if item != nil
        expanded_hash[index(item.key, @size)] = item
      end
    end
    @items = expanded_hash
  end
end