require_relative 'node'
require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, self.size)
    if @items[i].nil?
      item = LinkedList.new
      item.add_to_tail(node)
      @items[i] = item
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
    i = index(key, self.size)
    if !@items[i].nil?
      node = @items[i].find_node(key)
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
  # Load factor is the number of elements in a hash table divided by the number of buckets it has allocated.
  def load_factor
    x = 0.0
    for i in 0..self.size-1
      if !@items[i].nil?
        x += @items[i].size
      end
    end
    x / self.size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items.compact
    @items = Array.new(self.size * 2)
    temp.each do |item|
      while item.size > 0
        node = item.remove_front
        self[node.key] = node.value
      end
    end

    # temp = Array.new(@items.length * 2)
    # (0...@items.length).each do |i|
    #   if @items[i] != nil
    #     currNode = @items[i].head
    #     until currNode == nil
    #       newIndex = currNode.key.sum % temp.length
    #       temp[newIndex] = LinkedList.new
    #       temp[newIndex].add_to_front(currNode)
    #       currNode = currNode.next
    #     end
    #     @items[i] = nil
    #   end
    # end
    # # assign the temp array to our items array
    # @items = temp
  end
end
