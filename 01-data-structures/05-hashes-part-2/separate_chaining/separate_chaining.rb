require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    i = index(key, @items.size)
    n = Node.new(key, value)

    if @items[i] != nil 
      list = @items[i]
    else 
      list = LinkedList.new
    end

    list.add_to_tail(n)
    @items[i] = list
    @item_count += 1

    if load_factor > max_load_factor
      resize
    end

    printHash
  end

  def [](key)
    list = @items.at(index(key, @items.size))
    if list != nil
      current = list.head
      while current != nil
        if current.key === key
          return current.value
        end
        current = current.next
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
    @item_count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_size = size * 2
    new_items = Array.new(new_size)
    i = 0
    while i < @items.size
      list = @items[i]
      if list != nil
        current = list.head
        new_index = index(current.key, new_items.size)
        while current != nil
          list = LinkedList.new
          list.add_to_tail(current)
          new_items[new_index] = list
          current = current.next
        end
      end
      i += 1
    end
    @items = new_items
  end

  def printHash
    @items.each do |x|
      if x.is_a? LinkedList
        i = x.head
        if i.next === nil
          print i.value
        else
          while i != nil do
            print "#{i.value}"
            if i.next != nil
              print " | "
            end
            i = i.next
          end
        end
        puts ""
      end
    end
    puts "Load Factor: #{load_factor.round(3)}"
  end
end