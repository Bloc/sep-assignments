class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    @items[key.sum % @items.size] = value
  end


  def [](key)
    @items[key.sum % @items.size]
  end

  def resize
    # for i in 0..@items.size
    #   @items.push
    # end
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

h = HashClass.new(6)
h.[]=("Charlie", "Man")
h.[]=("Twigg", "Dog")
puts h.[]("Charlie")
puts h.[]("Twigg")

puts h.inspect