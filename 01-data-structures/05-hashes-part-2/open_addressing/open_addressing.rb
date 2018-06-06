require_relative 'node'

class OpenAddressing

  attr_accessor :items

  def initialize(size)
    @items = Array.new(size, 'empty')
  end

  def []=(key, value)
    node = Node.new(key, value)
    index = next_open_index(0)
    if index != -1
      @items[index] = node
    else
      self.resize
      new_index = next_open_index(0)
      @items[new_index] = node
    end
  end

  def [](key)
    @items.each do |node|
      if node != 'empty' && node.key === key
        return node.value
      end
    end
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

  # Given an index, find the next open index in @items
  def next_open_index(index)
    for i in index...@items.length do
      if @items[i] == 'empty'
        return i
      end
    end
    -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    double = self.size
    double.times do
      @items << 'empty'
    end
  end

  def status
    total_values = 0
    @items.each_with_index do |node, index|
      if node != 'empty'
        puts "INDEX #{index} = KEY: #{node.key}, VALUE: #{node.value}"
        total_values += 1
      end
    end
    puts " "
    puts "The hash has #{@items.length} buckets and #{total_values} values stored"
    puts "The Load factor is #{(total_values.to_f / @items.length.to_f)}"
  end
end
