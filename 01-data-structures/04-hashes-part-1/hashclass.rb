class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  #Setter - The Custom Define Operator
  def []=(key, value)
    new_item = HashItem.new(key, value)
    #Create a new Item to attach to the Hash

    hash_index = index(key, size)
    #Create the index for our new item

    if @items[hash_index] == nil
      #If the value at hash index is nil (or empty)
      @items[index(key,size)] = new_item

    elsif @items[hash_index].key != key
      # Else if the key of index does not equal key of the new item
      # The Hash needs to be resized
      while !@items[hash_index].nil? do
        #while the Array's hash_index is full
        #resize until there is space
        self.resize
      end
    @items[index(key,size)] = new_item

    elsif @items[hash_index].key == key && @items[hash_index].value != value
      # Else if there is a collision and the values are different
      #resize until there is space
      self.resize
      @items[index(key,size)] = new_item
    end
  end


  #Getter - retrieve the value
  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end


  def resize
     @size = @size * 2
    expanded_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
        expanded_hash[index(item.key, @size)] = item
      end
    end
    @items = expanded_hash
  end


  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    #option 2
    #refactored
    key.sum % size

    #option 1
    # total_sum = 0
    # key.each_byte do |x|
    #   total_sum += x
    # end
    # return total_sum % size

    #each_byte() Passes each byte in str to the given block,
    #or returns an enumerator if no block is given.

    #example
    # "hello".each_byte {|c| print c, ' ' }
    # => 104 101 108 108 111
  end


  # Simple method to return the number of items in the hash
  def size
    #option 2
    #refactored
    @size

    #option 1
    # @items.length
  end

end