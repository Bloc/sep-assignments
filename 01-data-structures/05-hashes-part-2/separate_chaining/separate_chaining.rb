require_relative 'node'
require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, self.size)
    if @items[i].nil?
      list = LinkedList.new
      list.add_to_tail(node)
      @items[i] = list
    elsif @items[i].size < 5
      @items[i].add_to_tail(node)
    else
      resize
      self[key] = value
    end
    if self.load_factor > @max_load_factor
      resize
    end
  end

  def [](key)

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)

  end

  # Calculate the current load factor
  def load_factor

  end

  # Simple method to return the number of items in the hash
  def size

  end

  # Resize the hash
  def resize

  end


end
