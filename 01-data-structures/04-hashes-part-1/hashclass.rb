class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    saved_hashed_item = @items[index(key,@size)]
    # If Index is nil, save.
    if @items[index(key,@size)].nil?
      @items[index(key,@size)] = HashItem.new(key, value)

    # else if argument key != saved_hashed_item.key
    elsif key != saved_hashed_item.key
      while !@items[index(key, @size)].key.nil? && @items[index(key, @size)].key != key
        resize
        new_i = index(key, @size)
        break if @items[new_i].nil?
      end
      @items[new_i] = HashItem.new(key, value)

    # else if argument key == saved_hashed_item.key && value != saved_hashed_item.value
    elsif key == saved_hashed_item.key && value != saved_hashed_item.value
      resize
      @items[index(key,@size)] = HashItem.new(key, value)
    end
  end


  def [](key)
    @items[index(key,@size)].value
  end

  def resize
    @size *= 2
    rehashed = Array.new(@size)
    @items.each do |item|
      unless item.nil?
        rehashed.insert(index(item.key,@size),item)
      end
    end
    @items = rehashed
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