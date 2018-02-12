class HashClass

  def initialize(size)
    items = Array.new(size)
    @items = items
  end

  def []=(key, value)
    @items.push([key, value])
    @items.delete_if{|k, v| k == nil}

    @items
  end


  def [](key)
    @items.assoc(key)[1]
  end

  def resize
    len = @items.length
    arr = Array.new(len, [])

    @items = @items + arr
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    @items
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
