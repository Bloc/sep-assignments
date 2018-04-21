require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :item_count

  def initialize(size)
    @max_load_factor = 0.7 
    @item_count = 0.0   
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    index = self.index(key, size)

    @items[index] = @items[index] || LinkedList.new

    @items[index].add_to_tail(Node.new(key, value))
    @item_count += 1
    
    if load_factor >= @max_load_factor
      self.resize
    end
  end

  def [](key)
    index = self.index(key, size)
    if @items[index] != nil
      current = @items[index].head
      
      while current !=nil
        if current.key === key 
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
    counter = 0.0
    @items.each do |item|
      next unless item
      counter += item.iterate
    end
    counter / size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size *= 2
    old_array = @items 
    @items = Array.new(@size)
    old_array.each do |i|
      if i != nil
        current = i.head
        while current != nil
          self.[]=(current.key, current.value)
          current = current.next
        end
      end
    end
    self.status
  end
  
  def status
    if @item_count === 0.0
        puts "There is no hash."
        puts "Load Factor is 0."
    else
       @items.each do |ll|
          unless ll.nil?
              current = ll.head
              index = self.index(current.key, size)
              until current.nil?
                puts "#{current} is at Index #{index} and has a value of " + "\"" + "#{current.value}" + "\"" + "."
                current = current.next
              end
          end
        end
        puts "Load Factor is #{load_factor}."
    end
  end
end
