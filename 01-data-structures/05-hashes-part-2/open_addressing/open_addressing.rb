require_relative 'node'

class OpenAddressing

  attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    index = index(node.key, self.size)
    if !@items[index]
      @items[index] = node
    elsif next_open_index(index) != -1
      @items[next_open_index(index)] = node
    else
      self.resize
      new_index = index(node.key, self.size)
      @items[new_index] = node
    end
  end

  def [](key)
    @items.each do |node|
      if node && node.key === key
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
      if !@items[i]
        return i
      end
    end
    for i in 0...index do
      if !@items[i]
        return i
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_array = Array.new((@items.length * 2))
    @items.each do |node|
      if node
        index = index(node.key, new_array.length)
        new_array[index] = node
      end
    end
    @items = new_array
  end

  def status
    total_values = 0
    @items.each_with_index do |node, index|
      if node
        puts "INDEX #{index} = KEY: #{node.key}, VALUE: #{node.value}"
        total_values += 1
      end
    end
    puts " "
    puts "The hash has #{@items.length} BUCKETS and #{total_values} VALUES stored"
    puts "The LOAD FACTOR is #{(total_values.to_f / @items.length.to_f)}"
  end
end
