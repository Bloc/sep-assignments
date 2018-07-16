require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @entries = 0.0 
  end

  def []=(key, value)
    @entries += 1 
    self.resize if load_factor > @max_load_factor
    hash_index = self.index(key, size)
    @items[hash_index] = @items[hash_index] || LinkedList.new 
    @items[hash_index].add_to_tail(Node.new(key, value))
  end

  def [](key)
    @items[index(key,size)].get_value(key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size 
  end

  # Calculate the current load factor
  def load_factor
    @entries/size 
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length 
  end

  # Resize the hash
  def resize
    item_holder = @items 
    @items = Array.new(2 * size)
    item_holder.each do |node|
      if !node.nil?
        node_holder = node.head 
        while node_holder 
          hash_index = self.index(node_holder.key, size)
          @items[hash_index] = LinkedList.new 
          @items[hash_index].add_to_tail(Node.new(node_holder.key, node_holder.value))
          node_holder = node_holder.next 
        end 
      end 
    end
    self.status_update
  end

  def status_update 
    if @item_count === 0.0
      puts "There is no hash."
      puts "Load Factor is 0."
    else
      puts "Begin status update __________________________"
       @items.each do |linked_list|
          unless linked_list.nil?
              current = linked_list.head
              index = self.index(current.key, size)
              until current.nil?
                puts "#{current} is at Index #{index} with key: #{current.key} and has a value of " + "\"" + "#{current.value}" + "\"" + "."
                current = current.next
              end
          end
        end
        puts "Load Factor is #{load_factor}."
        puts "End of status update._________________________"
    end
  end
end
