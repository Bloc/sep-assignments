require_relative 'node'

class OpenAddressing
  def initialize(size)
    @nodes = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, self.size)
    if @nodes[i].nil?
      @nodes[i] = node
    else
      j = self.next_open_index(i)
      if j == -1
        resize
        self[key] = value
      else
        @nodes[j] = node 
      end
    end
  end

  def [](key)
    i = index(key, self.size)
    while @nodes[i].key != key && i < self.size
      i += 1
    end
    return @nodes[i].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    i = index
    while !@nodes[i].nil? && i < self.size
      i += 1
    end
    if i >= self.size
      i = -1
    end
    return i
  end

  # Simple method to return the number of items in the hash
  def size
    @nodes.length
  end

  # Resize the hash
  def resize
    old_nodes = @nodes.compact
    @nodes = Array.new(self.size * 2)
    old_nodes.each { |node| self[node.key] = node.value }
  end
end