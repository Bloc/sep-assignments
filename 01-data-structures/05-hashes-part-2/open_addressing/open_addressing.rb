require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    i = index(key, self.size)
    if @items[i].nil?
      @items[i] = Node.new(key, value)
      @count += 1
    elsif @items[i].key.eql?(key) && @items[i].value.eql?(value)
      return
    else
      next_open = next_open_index(i)
      if @items[i].key == key && @items[i].value != value && next_open == -1
        resize
        @items[next_open].value = value
        @count += 1
      elsif next_open == -1
        resize
        self[key] = value
      else
        @items[next_open] = Node.new(key, value)
        @items[next_open].value = value
        @count += 1
      end
    end
  end

  def [](key)
    e = index(key, self.size)
    until e > self.size
      if @items[e].key == key
        return @items[e].value
      else
        e += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % self.size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    until @items[index].nil?
      index += 1
    end
    index >= self.size ?  -1 :  index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    original_ary = @items
    @items = Array.new(original_ary * 2)
    original_ary.each do |i|
      if i
        index = self.index(i.key, @items.length)
        @items[index] = Node.new(i.key, i.value)
      end
    end
  end

  def load_factor
    j = 0.to_f

    (0...self.size).each do |i|
      if @items[i]
        j += 1
      end
    end
    j / self.size
  end

  def print
    (0...self.size).each do |i|
      if @items[i]
        puts "Index: #{i} - Key: #{@items[i].key} - Value: #{@items[i].value}"
      end
    end
    puts "Load Factor of: #{load_factor}"
  end

end
