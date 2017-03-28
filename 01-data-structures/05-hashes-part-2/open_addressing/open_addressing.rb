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
    elsif @nodes[i].key == key
      @nodes[i].value = value
      if self.next_open_index(i) == -1
        resize
      end
    else
      j = self.next_open_index(i)
      if j != -1
        @nodes[j] = node 
      else
        resize
        self[key] = value
      end
    end
  end

  def [](key)
    i = index(key, self.size)
    for j in i..self.size-1
      if @nodes[j].key == key
        return @nodes[j].value
      end
    end
    if i > 0
      for j in 0..i-1
        if @nodes[j].key == key
          return @nodes[j].value
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
    i = index
    for i in index..self.size-1 do
      if @nodes[i].nil? 
        return i
      end
    end
    if index > 0
      for i in 0..index-1
        if @nodes[i].nil?
          return i
        end
      end
    end
    return -1
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

  def load_factor
    x = 0.0
    for i in 0..size-1 do
      if !@nodes[i].nil?
        x = x + 1
      end
    end
    x / size 
  end

  def print
    for i in 0..size-1 do
      if !@nodes[i].nil?
        puts "Hash: #{index(@nodes[i].key, self.size)} -> Index: #{i} -> Key: #{@nodes[i].key} -> Value: #{@nodes[i].value}"
      end
    end
  end 
end