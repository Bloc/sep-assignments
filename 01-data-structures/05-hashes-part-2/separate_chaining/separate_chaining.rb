require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)

    @max_load_factor = 0.7
    @items = Array.new(size)
    @count = 0 #count all objects for load factor calculation
  end

  # Insert Method
  def []=(key, value)
    node = Node.new(key, value)
    i = self.index(key, self.size)
    linked_list = @items[i]
    if linked_list.nil?
      linked_list = LinkedList.new
      @items[i] = linked_list
    end
    linked_list.add_to_tail(node)
    @count += 1
    if self.load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    puts("ENTERED LOOKUP")
    i = index(key, self.size)
    if @items[i] != nil
      puts(@items[i].size)
      node = @items[i].search_node(key)
      if node != nil
        puts(node)
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
    @count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp_array = @items.compact
    @items = Array.new(self.size * 2)
    @count = 0
    temp_array.each do |linked_list|
      while linked_list.size > 0
        node = linked_list.remove_front
        self[node.key] = node.value #call []= and reinser into resized arr
      end
    end
  end

  def print_items
    (0...self.size).each do |i|
      if @items[i] != nil
        @items[i].print
        puts "index: #{i}"
      end
    end
    puts "load factor: #{load_factor()}"
  end
end
