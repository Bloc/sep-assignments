require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    # index = index(key, size)
    # new_node = Node.new(key, value)
    #
    # if @items[index] == nil
    #   @items[index] = new_node
    #   @head = new_node
    # elsif load_factor < @max_load_factor
    #   @items[index].add_to_tail(new_node)
    # end
  end

  def [](key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    resized_hash = Array.new(size * 2)

    @items.each do |i|
      if i != nil
        resized_hash[index(i.key, size)] = i
      end
    end
    @items = resized_hash
  end
end
