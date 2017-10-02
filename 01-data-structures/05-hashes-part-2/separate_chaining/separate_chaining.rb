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
    i = index(key, size)
    if @items[i]
      current = @items[i].head
      while !current.eql?(nil)
        if current.key.eql?(key)
          return current.value
        else
          current = current.next
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

  # Calculate the current load factor
  def load_factor
    j = 0.to_f

    (0...self.size).each do |i|
      if @items[i]
        j += @items[i].size
      end
    end
    j / self.size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    original_list = @items
    @items = Array.new(self.size * 2)
    original_list.compact.each do |item|
      until item.size <= 0
        node = item.remove_front
        self[node.key] = node.value
      end
    end
  end

  def print
    loadFactor = ( (@items.compact.size) / self.size.to_f )

    @items.compact.each_with_index do |each, index|
        puts "Index: #{index} - Value: #{each.inspect}"
    end
        puts "Load Factor of: #{loadFactor}"
  end
end
