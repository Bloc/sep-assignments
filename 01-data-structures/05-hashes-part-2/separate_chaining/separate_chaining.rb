require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @entries = 0.0
  end

  def []=(key, value)
    @entries += 1
    self.resize if load_factor > @max_load_factor
    hash_index = self.index(key,size)
    #if the array is nil, create linked_list 
    @items[hash_index] = @items[hash_index] || LinkedList.new
    @items[hash_index].add_to_tail(Node.new(key, value))

  end

  def [](key)
    @items[index(key,size)].find_value(key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @entries/size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp_items = @items
    @items = Array.new(2 * size)
    temp_items.each do |llist|
      if !llist.nil?
        temp_node = llist.head
        while temp_node
          hash_index = self.index(temp_node.key,size)
          @items[hash_index] = LinkedList.new
          @items[hash_index].add_to_tail(Node.new(temp_node.key, temp_node.value))
          temp_node = temp_node.next
        end
      end
    end
  end
end
