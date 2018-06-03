require_relative 'hash_item'

class HashClass

  attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
  end

  # a[b] = c is the same as a.[]=(b, c)
  def []=(key, value)
    item = [key, value]
    if @items[index(item[0], self.size)] === nil || @items[index(item[0], self.size)][1] === value
      @items[index(item[0], self.size)] = item
    else
      self.resize
      @items.each_with_index do |item, index|
        if item != nil
          @items[index] = nil
          @items[index(item[0], self.size)] = item
        end
      end
      @items[index(item[0], self.size)] = item
    end
  end

  # a[b] is the same as a.[](b)
  def [](key)
    @items.each do |i|
      if i != nil && i[0] === key
        return i[1]
      end
    end
  end

  def resize
    double = self.size
    double.times do
      @items << nil
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
        sum += c
    end
    sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
