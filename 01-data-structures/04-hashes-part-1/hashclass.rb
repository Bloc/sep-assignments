class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  #Element Assignment
  def []=(key, value)
    #get index from hashing algorithm
    index = self.index(key, self.size)
    #store new key,value pair as a new hash item
    new_hash_item = HashItem.new(key, value)

    #if index is free => insert new_hash_item
    #if index.key != new key are different => resize ???
    #if index is not free && not a duplicate => resize the array until the index is free then insert new_hash_item
    if @items[index] == nil
      @items[index] = new_hash_item
    elsif @items[index].key != new_hash_item.key
      self.resize
      self[key] = value
    elsif @items[index].value != new_hash_item.value
      self.resize
      @items[index(new_hash_item.key, size)] = new_hash_item
    end

    print "\n Hash size: #{self.size} \n Internal Array: #{@items} \n"
  end

  #Element Reference
  def [](key)
    index = self.index(key, self.size)
    @items[index].value
  end

  def resize
    #copy of current Array
    temp_array = Marshal.load(Marshal.dump(@items))

    #create items array double the size
    current_size = self.size
    @items = Array.new(current_size * 2)

    #rehash keys
    #for each element in temp, get key & value and then recall def []=(key, value)
    temp_array.each { |e|
      unless e.nil?
        index = self.index(e.key, self.size)
        @items[index] = e
      end
    }
    print "\n HASH RESIZING! \n Hash size: #{self.size} \n Internal Array: #{@items} \n"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
