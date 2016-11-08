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
          self.resize
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
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    next_index = index + 1
    while next_index < @items.length
      if @items[next_index].nil?
        return next_index
      end
      next_index +=1
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp_items = @items
    @items = Array.new(self.size * 2)
    temp_items.each do |item|
      unless item.nil?
        index = self.index(item.key, @items.length)
        if @items[index].nil?
          @items[index] = item
        else
          self.resize
          self[item.key] = item.value
        end
      end
    end
  end
end
