require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @count = 0
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.length)
    item = Node.new(key, value)

    if @items[i] == nil
      list = LinkedList.new
      list.add_to_tail(item)
      @items[i] = list
      @count += 1
    else
      @items[i].add_to_tail(item)
      @count += 1
    end

    if load_factor.to_f > max_load_factor.to_f
      resize
    end
  end

  def [](key)
    i = index(key, @items.length)
	  list = @items[i]
    if list != nil
      item = list.head
      while item != nil
        if item.key == key
          return item.value
        end
        item = item.next
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
    @count.to_f / size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
      doubled_array = Array.new(@items.length * 2)
      (0..@items.size-1).each do |i|
        list = @items[i]
        if list != nil
          item = list.head
          new_index = index(item.key, doubled_array.size)
          while item != nil
            list = LinkedList.new
            list.add_to_tail(item)
            doubled_array[new_index] = list
            item = item.next
          end
        end
      end

      @items = doubled_array
    end

end
