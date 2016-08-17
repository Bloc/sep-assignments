require_relative "hash_item"

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = self.index(key, @items.length)

    if @items[index].nil?
      @items[index] = HashItem.new(key, value)
    elsif @items[index].key == key
      unless @items[index].value == value
        @items[index].value = value
        self.resize #for the spec
      end
    else
      self.resize
      self[key] = value
    end
  end

  def [](key)
    index = self.index(key, @items.length)

    unless @items[index].nil? || @items[index].key != key
      @items[index].value
    end
  end

  def resize
    old_array = @items
    @items = Array.new(@items.length * 2)

    old_array.each do |hash_item|
      unless hash_item.nil?
        index = self.index(hash_item.key, @items.length)

        if @items[index].nil?
          @items[index] = hash_item
        else
          self.resize
          self[hash_item.key] = hash_item.value
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    (key.sum % size)
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
