require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = self.index(key, @items.length)

    if @items[index].nil?
      @items[index] = Node.new(key, value)
    elsif @items[index].key == key
      unless @items[index].value == value
        @items[index].value = value
        next_index = self.next_open_index(index)
        if next_index == -1
          self.resize #for the spec
        end
      end
    else
      next_index = self.next_open_index(index)
      if next_index != -1
        @items[next_index] = Node.new(key, value)
      else
        self.resize
        self[key] = value
      end
    end
  end

  def [](key)
    index = self.index(key, @items.length)

    unless @items[index].nil?
      if @items[index].key == key
        @items[index].value
      else
        @items[index + 1..-1].each do |item|
          unless item.nil?
            if item.key == key
              return item.value
            end
          end
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    (key.sum % size)
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    x = index + 1
    while x < @items.length
      if @items[x].nil?
        return x
      end
      x += 1
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(@items.length * 2)

    old_array.each do |hash_item|
      unless hash_item.nil?
        index = self.index(hash_item.key, @items.length)

        if @items[index].nil?
          @items[index] = hash_item
        else
          next_index = self.next_open_index(index)
          if next_index != -1
            @items[next_index] = hash_item
          else
            self.resize
            self[hash_item.key] = hash_item.value
          end
        end
      end
    end
  end
end
