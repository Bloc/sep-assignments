require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(capacity)
    @max_load_factor = 0.7
    @items = Array.new(capacity)
    @number_items = 0 # record number of insertions, to be used for deciding when to resize
  end
  
  def insert(node)
    key = node.key

    i = self.index(key, self.size) # find outt he index
    llist = @items[i] # the linked list at that index
    if llist == nil # if nothing at that index, create new linked list
      llist = LinkedList.new
      @items[i] = llist
      return
    end

    node1 = llist.head # find out the current head of that linked list
    
    if node1 == nil # If the linked list is empty, the new node becomes
      llist.add_to_tail(node) # the only element
      self.print_state
      return
    end
    
    # search for one of two conditions: (1) a node with no "next" (meaning
    # you're at the end of the list), or (2) a node with the same key (meaning
    # you're overwriting an existing value)
    until node1.next == nil || node1.next.key == key do
      node1 = node1.next
    end
    
    node.next = node1.next 
    node1.next = node # in case (2), node.next replaces node1.next
    if node1 == llist.tail # in case (1) node becomes the new tail
      llist.tail = node
    end
    
    self.print_state
  end

  def []=(key, value)
    @number_items += 1 # increment the number of insertions
    if self.load_factor >= @max_load_factor
      resize
    end
    node = Node.new(key,value) # create node for that key/value pair
    self.insert(node)
  end

  def [](key)
    i = self.index(key, self.size) # compute the index
    llist = @items[i] # find the linked list at that index
    if llist == nil # if nothing there, then there is no value for that key
      return nil
    end
    node = llist.head # if something there, then search through all items in the linked list
    # search through nodes in the list for (1) no next (meaning you've reached
    # the end without finding the node) or (2) a node with the same key, in which
    # case, that's the node you're looking for.
    until node == nil || node.key == key do 
      node = node.next
    end
    if node == nil # nothing found
      return nil
    end
    return node.value # if something is found, return its value
  end
  
  def get_list # this is for debugging
    return @items
  end
  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, capacity)
    value = 0
    chars = key.split("")
    chars.each do |c|
      value += c.ord
    end
    return value % self.size 
  end

  # Calculate the current load factor
  def load_factor
    return (1.0 * @number_items)/@items.length # multiplying by 1.0 makes it a float rather than integer
  end

  # Simple method to return the number of items in the hash
  # Note: it's not really the number of items, it's the size of the array.
  # The array might not be full, so it's not the same as the number of items.
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    arr = @items # save the old array
    n = self.size 
    @items = Array.new(n*2) # create new array of double the size

    # go through each linked list in the old array, and each item in each linked
    # list, and insert into the new array.
    arr.each do |llist|
      if llist != nil
        node = llist.head
        until node == nil do
          self.insert(node)
          node = node.next
        end
      end
    end
  end

  # this represents the state of the hash table by
  # printing "." for each nil in the array, and [ a, b, c, ...]
  # for each linked list, where a, b, etc. are integers for each
  # node (each node is given a unique integer, because that takes up
  # less room than printing the key/value pair)
  def print_state
    lf = (load_factor * 100).to_i
    retval = "(LF: #{lf}%) "
    @items.each do |item|
      if item == nil
        retval += "."
      else
        retval += '['
        node = item.head
        first = true
        until node == nil do
          if first
            first = false
          else
            retval += ", "
          end
          retval += "#{node.label}"
          node = node.next
        end
        retval += "]"
      end
    end
    puts retval
  end
end
