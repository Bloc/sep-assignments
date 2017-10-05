class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    resize if @items[i] != nil && @items[i] != value
    @items[i] = value
  end


  def [](key)
    @items[index(key, size)]
  end

  def resize
    hash_primes = [0, 5, 11, 19, 37, 67, 131, 283]
    size = [hash_primes.find_index(size) + 1]
    temp_items = @items
    @items = Array.new(size)
    temp_items.each_with_index do |key, value|
      @items[index(key, size)] = value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    x = 0
    key.each_codepoint { |c| x += c }
    x % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
