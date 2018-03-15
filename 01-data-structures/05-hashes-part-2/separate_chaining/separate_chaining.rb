require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    index = self.index(key, self.size)

    #get @items[index] & set equal to old_head
    old_head = @items[index]

    #if old_head exists (& not a duplicate) set old_head to next node
    #else index is open set @items[index] to node containing key,value
    if old_head && old_head.key == key
        old_head.value = value
    elsif old_head
      @items[index] = Node.new(key, value, old_head)
    else
      @items[index] = Node.new(key, value)
    end

    #if load factor > max_load_factor => resize/rehash
    if self.load_factor > max_load_factor
      self.resize
    end

    print "\n Load Factor: #{self.load_factor} \n Internal Array: #{@items} \n"
  end

  def [](key)
    index = self.index(key, self.size)
    head = @items[index]

    if head.key == key
      head.value
    else
      current = head
      while current.key
        return current.value if current.key == key
        current = current.next_node
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
    #for each element that is not nil in items => calc length of linked_link
    items_present = 0
    @items.each { |x| items_present += self.ll_length(x) if !x.nil? }

    load_factor = (items_present.to_f)/(self.size.to_f)
  end

  def ll_length(list)
    count = 0
    current = list
    while current
      current = current.next_node
      count += 1
    end
    count
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    #copy of current Array
    temp_array = Marshal.load(Marshal.dump(@items))

    #create items array double the size
    @items = Array.new(self.size * 2)

    #rehash keys
    #for each element in temp, get key & value and then recall def []=(key, value)
    temp_array.each { |node|
      if !node.nil?
        while node
          self[node.key] = node.value
          node = node.next_node
        end
      end
    }
    print "\n HASH AFTER RESIZING! \n Hash size: #{self.size} \n Internal Array: #{@items} \n"
  end
end
