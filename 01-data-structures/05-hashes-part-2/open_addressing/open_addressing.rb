require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  # SET
  def []=(key, value)
    index = self.index(key, @size)

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

  # GET
  def [](key)
  index = self.index(key, @size)

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
    @size
  end

  # Resize the hash
  def resize
    @size = @size * 2
    temp_items = @items.compact  # get rid of nil values
    @items = Array.new(@size)

    temp_items.each do |item|
      index = self.index(item.key, @size)

      if @items[index].nil?
        @items[index] = item
      else
        self.resize
      end
    ends
  end
end
