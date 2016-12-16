class HashClass
  require_relative 'hash_item'

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    key_id = index(key, self.size)
    hash = HashItem.new(key, value);

    if @items[key_id].nil?
      @items[key_id] = hash
    elsif @items[key_id].key != key
      self.resize
      self[key] = value
    elsif @items[key_id].key === key && @items[key_id].value != value

      self.resize
      #Shouldnt this reassign the value to new value and not expand?  Weird
      @items[key_id]
    end

  end


  def [](key)
    if @items[index(key, size)].nil? == true
      nil
    else
      @items[index(key, size)].value
    end
  end

  def resize
    arr = @items
    @items = Array.new(arr.length * 2)

    arr.each do |i|
      if i.nil? == false
        @items[index(i.key, @items.length)] = HashItem.new(i.key, i.value)
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.

  #many errors was caused here because I had `self.size` instead of size.  It was ruining computations and causing returns of nil
  def index(key, size)
    i = key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
