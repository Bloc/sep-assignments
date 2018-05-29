class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value) #Setter - The Custom Define Operator
    new_item = HashItem.new(key, value) #Create a new Item to attach to the Hash
    hash_index = index(key, size) #Create the index for our new item
    if @items[hash_index] == nil
      # If the value at hash index is nil (or empty)
      @items[index(key,size)] = new_item
    elsif @items[hash_index].key != key
      # Else if the key of index does not equal key of the new item
      # The Hash needs to be resized
      while !@items[index(key,size)].nil? do #resize until there is space
        self.resize
      end
      @items[index(key,size)] = new_item
    elsif @items[hash_index].key == key && @items[hash_index].value != value
      # Else if there is a collision and the values are different
      # Just Resize the class Array
      self.resize
      @items[index(key,size)] = new_item
    end
  end

  def [](key) #Getter
    return @items[index(key,size)].value
  end

  def resize
    new_size = 0
    temp_items = @items
    new_size = @items.length * 2
    @items = Array.new(new_size)
    temp_items.each do |x|
      if !x.nil?
        new_item = HashItem.new(x.key,x.value)
        @items[index(x.key,new_size)] = new_item
      end
    end
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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
