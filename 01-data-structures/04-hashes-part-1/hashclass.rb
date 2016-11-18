class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  # set
  def []=(key, value)
    index = index(key, @size)

    # empty hash
    if @items[index].nil?
      @items[index] = HashItem.new(key, value)

    # new key
    elsif @items[index].key != key
      resize()
      self[key] = value

      # same key, new value
    elsif @items[index].key === key && @items[index].value != value
      resize()
      @items[index(key, @size)].value = value

    # else - do nothing if same key same value (no else statement)
    end

    p @items
    p @size
  end

  # get
  def [](key)
    if @items[index(key, @size)].key === key
      return @items[index(key, @size)].value
    end
  end

  def resize
    @size = 2 * @size
    temp = Array.new(@size)

    for entry in @items do
      if entry
        new_index = index(entry.key, @size)
        temp[new_index] = entry
      end
    end

    @items = temp
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
