class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  #Setter - The Custom Define Operator
  def []=(key, value)
    new_item = HashItem.new(key, value)
    hash_index = index(key, size)

    if @items[hash_index] == nil
      @items[index(key,size)] = new_item
    elsif @items[hash_index].key != key
      while !@items[hash_index].nil? do
        self.resize
      end
    @items[index(key,size)] = new_item

    elsif @items[hash_index].key == key && @items[hash_index].value != value
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
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end