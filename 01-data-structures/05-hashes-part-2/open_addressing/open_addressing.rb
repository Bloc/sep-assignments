require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0.0
  end

  def []=(key, value)
    index = index(key, size)

    if @items[index] == nil || @items[index].key === key
      @items[index] = Node.new(key, value)
    elsif next_open_index(index) == -1
      resize
      self[key] = value
    else
        index = next_open_index(index)
        @items[index] = Node.new(key, value)
    end
    @item_count += 1
    #hash_status
  end

  def [](key)
    index = index(key, size)

    if @items[index].key == key
      return @items[index].value
    end
    until index == size
        index += 1
      if @items[index].key == key
        return @items[index].value
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
        resized_hash[index(i.key, resized_hash.length)] = i
      end
    end
    @items = resized_hash
  end

  def load_factor
    @item_count / size
  end

  def hash_status
    j = 0
    p "-------------------"
    p "Load Factor: #{load_factor}"
    @items.each do |i|
      if i != nil
        p "Index: #{j}"
        p "Key: #{i.key}"
        p "Value: #{i.value}"
        p "~~~~~~~~~~~~~~~~~"
        j += 1
      end
    end
    p "-------------------"

  end

end
