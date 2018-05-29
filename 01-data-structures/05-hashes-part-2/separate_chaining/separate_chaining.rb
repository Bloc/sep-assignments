require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @total_items = 0
  end

  def []=(key, value) #setter
    @total_items += 1;
    resize if load_factor > @max_load_factor

    new_item = Node.new(key, value) #Create a new Item to attach to the Hash
    hash_index = index(key, size) #Create the index for our new item
    if @items[hash_index] == nil
      # If the value at hash index is nil (or empty)
      #create a linked list and assign the head and next
      @items[hash_index] = LinkedList.new
      @items[hash_index].add_to_tail(new_item)
    else
      # Else if the key of index does not equal key of the new item
      # there is a collison get the linked list and insert infront
      llist = @items[hash_index]
      llist.add_to_front(new_item)
    end
  end

  def [](key) #getter
    get_index = index(key,size) #this is where the liked list is
    llist = @items[get_index]
    return llist.find_value(key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total_sum = 0
    key.each_byte do |x|
      total_sum += x
    end
    return total_sum % size
  end

  # Calculate the current load factor
  def load_factor
    return (@total_items.fdiv(size))
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_size = 0
    temp_items = @items
    new_size = @items.length * 2
    @items = Array.new(new_size)
    temp_items.each do |x|
      if !x.nil?
        llist = x
        old_node = llist.head
        until old_node == nil
          #every item has to be reidexed
          new_item = Node.new(old_node.key,old_node.value)
          hash_index = index(old_node.key, size)
          if @items[hash_index] == nil
            @items[hash_index] = LinkedList.new
            @items[hash_index].add_to_tail(new_item)
          else
            llist = @items[hash_index]
            llist.add_to_front(new_item)
          end
          old_node = old_node.next
        end
      end
    end
  end
end
