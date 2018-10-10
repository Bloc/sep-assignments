class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index_val = index(key, @items.length)
    # p @items[index_val]
    # p value
    if @items[index_val] === nil || @items[index_val][1] === value
      @items[index_val] = [key, value]
    else
      resize
    end
  end


  def [](key)
    puts "------------------"
    p @items
    index_val = index(key, @items.length)
    @items[index_val][1]
  end

  def resize
    @items += Array.new(@items.length)

    i = 0
    while i < @items.size
      if @items[i] != nil
        @items[index(@items[i][0], @items.size)] = [@items[i][0], @items[i][1]]
      end
      i += 1
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    i = 0
    hash_code = 0

    while(i < key.length)
      hash_code += key[i].ord
      i += 1
    end

    hash_code % size

    puts "------------------"
    p hash_code % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
