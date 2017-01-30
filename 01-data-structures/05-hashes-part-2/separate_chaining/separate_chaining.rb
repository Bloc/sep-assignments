require_relative 'node'
require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @lists = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, self.size)
    if @lists[i].nil?
      list = LinkedList.new
      list.add_to_tail(node)
      @lists[i] = list 
    elsif @lists[i].size < 5
      @lists[i].add_to_tail(node)
    else
      resize
      self[key] = value
    end
    if self.load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    i = index(key, self.size)
    if !@lists[i].nil?
      node = @lists[i].find_node(key)
      if !node.value.nil?
        return node.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    x = 0.0
    for i in 0..self.size-1
      if !@lists[i].nil?
        x += @lists[i].size 
      end
    end
    x / self.size 
  end

  # Simple method to return the number of items in the hash
  def size
    @lists.length
  end

  # Resize the hash
  def resize
    old_lists = @lists.compact
    @lists = Array.new(self.size * 2)
    old_lists.each do |list|
      while list.size > 0
        node = list.remove_front
        self[node.key] = node.value 
      end
    end
  end

  def print
    for i in 0..self.size-1
      if !@lists[i].nil?
        @lists[i].print(i)
      end
    end
  end
end
