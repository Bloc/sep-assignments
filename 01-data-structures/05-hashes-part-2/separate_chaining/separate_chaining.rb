require_relative 'node'
require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = self.index(key, self.size)
    list = @items[i]
    if list.nil?
      list = LinkedList.new
      @items[i] = list
    end
    list.add_to_tail(Node.new(key, value))
    @item_count += 1
    resize if self.load_factor > @max_load_factor
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
    @item_count / self.size.to_f
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
  end

  def print_items
    (0...size()).each do |i|
      if @items[i] != nil
        puts "index: #{i}"
        @items[i].print
      end
    end
    puts "load factor: #{load_factor()}"
  end
end
