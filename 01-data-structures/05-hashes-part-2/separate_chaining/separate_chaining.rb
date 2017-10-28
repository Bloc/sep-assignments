require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :items

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.length)
    item = Node.new(key, value)
    if @items[i] == nil
      @items[i] = item
    elsif @items[i].is_a?(Node)
      temp = @items[i]
      @items[i] = LinkedList.new
      @items[i].add_to_tail(temp)
      @items[i].add_to_tail(item)
    else
      @items[i].add_to_tail(item)
    end

    if self.load_factor >= @max_load_factor
      self.resize
    end
  end

  def [](key)
    i = index(key, @items.length)
    if @items[i].is_a?(LinkedList)
      return @items[i].find_by_key(key).value
    else
      return @items[i].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total_ascii = 0

    key.each_byte do |k|
      total_ascii += k
    end
    return total_ascii % size
  end

  # Calculate the current load factor
  def load_factor
    n = self.count_nodes.to_f
    k = @items.length.to_f
    return (n / k)
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    new_hash = SeparateChaining.new(@items.length * 2)

    @items.each do |i|
      if i != nil && i.is_a?(Node)
        new_hash[i.key] = i.value
      elsif i != nil && i.is_a?(LinkedList)
        temp = i.head
        while temp != nil do
          new_hash[temp.key] = temp.value
          temp = temp.next
        end
      end
    end
    @items = new_hash.items
  end

  #count the number of nodes in the hash
  def count_nodes
    count = 0

    @items.each_with_index {|item, i|
      if item.is_a?(Node)
        count += 1
      elsif item.is_a?(LinkedList)
        count += item.size
      else
        count += 0
      end
    }
    return count
  end

  def print
    puts "\{"
    @items.each_with_index {|item, i|
      if item != nil && item.is_a?(Node)
        puts "\t#{item.key}: #{item.value},"
      elsif item != nil && item.is_a?(LinkedList)
        temp = item.head
        while temp != nil do
          puts "\t#{temp.key}: #{temp.value},"
          temp = temp.next
        end
      end
    }
    puts "\}"
    puts "Load factor: #{self.load_factor}"
  end
end
