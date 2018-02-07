require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :linked_list

  def initialize(size)
    @max_load_factor = 0.7
    @linked_list = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    idx = self.index(key, size)
    linked_list = @linked_list[idx]
    if linked_list.nil?
      linked_list = LinkedList.new
    end
    linked_list.add_to_tail(Node.new(key, value))
    @count += 1
    if load_factor >= @max_load_factor
      resize
    end
  end

  def [](key)
    idx = self.index(key, size) 
    if @linked_list[idx]
      current = @linked_list[idx].head
      while current
        if current.key == key
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
    @count / size
  end

  # Simple method to return the number of items in the hash
  def size
    @linked_list.size
  end

  # Resize the hash
  def resize
    current_size = size
    temp_array = Array.new(current_size * 2)
    @linked_list.each do |item|
      if item
        key = item.key
        value = item.value
        new_idx = index(key, temp_array.size)
      end
    end
    @linked_list = temp_array
  end

  def status
    @linked_list.each do |item|
      if item
        current = item.head
        while current
          puts "Key: #{current.key}, Value: #{{current.value}}"
          current = current.next
        end
      end
    end
    puts "Load Factor: #{load_factor}"
  end
end
