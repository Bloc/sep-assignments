require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    new_item = Node.new(key, value) #Create a new Item to attach to the Hash
    insert(new_item)
  end

def insert(new_item)
  #Create a new Item to attach to the Hash
  hash_index = index(new_item.key, size) #Create the index for our new item

  if (@items[hash_index] === nil && hash_index <= size-1)# it is empty, yay!
    @items[hash_index] = new_item
  else # collison probing linear
    new_index = next_open_index(hash_index)
    if (new_index >= 0) #returns -1 if it can't find an open spot
      @items[new_index] = new_item
    else
      resize
      insert(new_item)
    end
  end

end

  def [](key)
    get_index = index(key,size) #this is where we 'think' the key is
    until (key === @items[get_index].key) do
      get_index += 1
    end
    @items[get_index].value
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

  # Given an index, find the next open index in @items
  def next_open_index(index)
    until (@items[index].nil?) || (index > size-1)
      index += 1;
    end
    index = -1 if index > size-1 #resize
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_size = 0
    temp_items = @items
    new_size = size * 2
    @items = Array.new(new_size)
    temp_items.each do |x|
      if ! x.nil?
        new_item = Node.new(x.key, x.value) #Create a new Item to attach to the Hash
        hash_index = index(x.key, new_size) #Create the index for our new item
        if @items[hash_index].nil? # it is empty, yay!
          @items[hash_index] = new_item
        else
          new_index = next_open_index(hash_index)
          @items[new_index] = new_item
        end
      end
    end
  end

  def print_hash
    index_pos = 0
    item_count = 0
    puts "\nHASH TABLE ***************************"
    @items.each do |x|
      if !x.nil?
        puts "[#{index_pos}] --- '#{x.key}'=>#{x.value}"
        item_count += 1
      else
        puts "[#{index_pos}] ---  EMPTY"
      end
      index_pos += 1
    end
    puts " ***** LOAD FACTOR = #{item_count.fdiv(size)} *****"
  end

end
