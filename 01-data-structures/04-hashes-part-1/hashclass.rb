class HashClass
  require_relative 'hash_item'

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    hash = @items[index(key, @size)]

    if hash == nil
      hash = HashItem.new(key, value)
    elsif hash.key != key
      self.resize
      self[key] = value
    elsif hash.key == key && hash.value != value
      self.resize
      hash.value = value
    end
  end


  def [](key)
  end

  def resize
    # move each item in the array to doubled_ary
    # update each items index based on the resized Array
    @items.compact.each do |i|
      doubled_ary[index(i.key, @size)] = i
    end

    puts "size: #{doubled_ary.length}"
    puts "state of array: #{doubled_ary}"
    @items = doubled_ary
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
  end

  # Simple method to return the number of items in the hash
  def size
  end

end
