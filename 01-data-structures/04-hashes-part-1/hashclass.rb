require_relative 'hash_item.rb'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  # new entry into Hash
  def []=(key, value)
    hash_index = index(key, @items.size)

    @items.each_with_index do |hash_value, hash_key|
      unless hash_value == nil
        if hash_key == hash_index && hash_value.value != value
          puts "#{key} has triggered a collision"
          self.resize
        end
      end
    end

    new_hash_item = HashItem.new(key, value)
    @items[hash_index] = new_hash_item
    puts "Key: #{key}"
    puts "Value: #{value}"
    puts "Hash Index: #{hash_index}"
    puts "Size: #{@items.size}"
    puts "-" * 10
  end


  def [](key)
    hash_index = index(key, @items.size)
    @items[hash_index].value
  end

  def resize
    @items.size.times do |i|
      @items << nil
    end
    # This passes, but I think this might break if the rehasing sets the hash_item's
    # new index to an existing hash_item
    # if that is the case, I could first push the new indexes and items to a
    # temp variable and then reset
    # hash after the loop is over
    @items.each do |hash_item|
      unless hash_item == nil
        new_hash_index = index(hash_item.key, @items.size)
        self[hash_item.key] = hash_item
      end
    end

    puts "*" * 10
    puts "RESIZE"
    puts "Size: #{@items.size}"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii_sum = 0
    key.split("").each do |word|
      ascii_sum += word.ord
    end
    ascii_sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

end
