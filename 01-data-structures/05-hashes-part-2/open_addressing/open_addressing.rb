require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    key_id = index(key, self.size)
    n = Node.new(key, value);

    if @items[key_id].nil?
      @items[key_id] = n
    elsif @items[key_id].key != key
      if next_open_index(key_id) == -1
        self.resize
        self[key] = value
      else
        key_id = next_open_index(key_id)
        @items[key_id] = n
      end
    elsif @items[key_id].key === key && @items[key_id].value != value
      if next_open_index(key_id) == -1
        self.resize
        @items[key_id] = n
      else
        @items[next_open_index(key_id)] = n
      end
    end
  end

  def [](key)
    if @items[index(key, size)].nil? == true
      nil
    elsif @items[index(key, size)].key == key
      @items[index(key, size)].value
    else
      @items.compact.each do |i|
        if i.key === key
          return i.value
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    i = key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    i = 0 #increment counter
    while @items[i].nil? === false #if this index of 'i' is not nil, increment by 1 and check the next
      if @items[i] === @items.last #once items[i] (as it loops) is the same as @items.last index, kill and return -1 (full)
        return -1
      else
        i += 1
      end
    end
    return i
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    arr = @items
    @items = Array.new(arr.length * 2)

    arr.each do |i|
      if i.nil? == false
        @items[index(i.key, @items.length)] = Node.new(i.key, i.value)
      end
    end
  end
end
