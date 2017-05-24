class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = key.sum % @items.size
    if @items[index]
      if @items[index][1] != value
        self.resize
      end
    end
    @items[key.sum % @items.size] = [key,value]
  end

  def [](key)
    if @items[key.sum % @items.size]
      @items[key.sum % @items.size][1]
    end
  end

  def resize
    old = @items
    @items = Array.new(self.size*2)
    for i in 0..old.length
      if old[i] 
        @items[ old[i][0].sum % @items.length ] = [old[i][0], old[i][1]]
      end
    end 
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  def add(v)
    k = v.sum % @k
    @items[k] = v
  end
end