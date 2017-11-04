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

      #@items[index(key,size)] = new_item
      puts "no collision - added #{@items[hash_index]} : index: #{hash_index} : items: #{@total_items}"
    else
      # Else if the key of index does not equal key of the new item
      # there is a collison get the linked list and insert infront
      llist = @items[hash_index]
      llist.add_to_front(new_item)

      puts "collision resolved : items: #{@total_items}"
      #@items[index(key,size)] = new_item
    end
  end

  def [](key) #getter
    puts "Get: #{key}"
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
    puts "***** total items: #{@total_items} Hash table size: #{size} : LOAD FACTOR: #{@total_items.fdiv(size)}"
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
    puts "**** resizing array"
    temp_items.each do |x|
      if !x.nil?
        llist = x
        puts "LinkedList: #{llist}"
        old_node = llist.head
        until old_node == nil
          puts "llist #{old_node.key} => #{old_node.value}"
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
      else
        puts "EMPTY"
      end
      # llist = x #linked list
      # next_node = llist.head
      # until next_node.next == nil
      #   puts "Key: #{next_node.key} => #{next_node.value}"
      #   next_node = next_node.next
      # end
      # if !x.nil?
      #   new_item = HashItem.new(x.key,x.value)
      #   @items[index(x.key,new_size)] = new_item
      # end
    end
  end
end
