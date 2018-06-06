require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :items

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size, LinkedList.new)
  end

  def []=(key, value)
    node = Node.new(key, value)
    index = index(node.key, @items.length)

  end

  def [](key)
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

  # Calculate the current load factor
  def load_factor
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    double = self.size
    double.times do
      @items << LinkedList.new
    end
  end
end
