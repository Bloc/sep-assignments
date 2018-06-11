require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :items

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new
    size.times do
      @items << LinkedList.new
    end
  end

  def []=(key, value)
    node = Node.new(key, value)
    bucket = index(node.key, self.size)
    bucket_values = @items[bucket].print_values
    density = @items[bucket].count
    if bucket_values.include?(node.value)
      return 'duplicate'
    elsif density > 5
      self.resize
      bucket = index(node.key, self.size)
      @items[bucket].add_to_tail(node)
    else
      @items[bucket].add_to_tail(node)
    end
    if self.load_factor > @max_load_factor
      self.resize
    end
  end

  def [](key)
    @items.each do |bucket|
      if !bucket.is_empty
        bucket_contents = bucket.print_nodes
        bucket_contents.each do |node|
          if node.key === key
            return node.value
          end
        end
      end
    end
    return "key not found"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
        sum += c
    end
    sum % size
  end

  # Calculate the current load factor
  def load_factor
    load_factor = 0
    @items.each do |bucket|
      if !bucket.is_empty
        load_factor += bucket.count
      end
    end
    load_factor = load_factor.fdiv(@items.length)
    load_factor
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_array = Array.new
    size = @items.length * 2
    size.times do
      new_array << LinkedList.new
    end
    nodes = Array.new
    @items.each_with_index do |bucket, index|
      if !bucket.is_empty
        bucket.print_nodes.each do |node|
          nodes << node
        end
      end
    end
    nodes.each do |node|
      bucket = index(node.key, self.size)
      new_array[bucket].add_to_tail(node)
    end
    @items = new_array
  end

  def status
  end

end
