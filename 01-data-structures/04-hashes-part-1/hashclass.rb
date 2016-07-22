require_relative 'hash_item.rb'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  # new entry into Hash
  def []=(key, value)
    puts "-" * 10
    hash_index = index(key, @items.size)
    if @items[hash_index] == nil
      # puts "No collision. Inserting into Hash..."
      new_hash_item = HashItem.new(key, value)
      @items[hash_index] = new_hash_item
    elsif @items[hash_index].value == value
      # puts "This is already in the hash...exiting insertion"
      return
    elsif @items[hash_index].key == key
      # puts "This item has a duplicate key...resizing and exiting"
      self.resize
    elsif @items[hash_index] != value
      # puts "This index is taken - resizing..."
      self.resize
      self[key] = value
    end
    puts "Key Inserted: #{key}"
    puts "Value Inserted: #{value}"
    puts "Hash Index: #{hash_index}"
    puts "Hash Size: #{@items.size}"
    puts "Hash: #{@items}"
    puts "-" * 10
  end


  def [](key)
    hash_index = index(key, @items.size)
    if @items[hash_index] == nil
      return "Error occurred: value is nil"
    else
      @items[hash_index].value
    end

  end

  def resize
    doubling_array = Array.new(@items.size)
    saved_items = []
    @items.each do |item|
      unless item == nil
        saved_items << item
      end
    end

    # erase the hash
    @items.map! do |hash_item|
      unless hash_item == nil
        hash_item = nil
      end
    end
    # smoosh them together
    @items.concat(doubling_array)

    saved_items.each do |item|
      self[item.key] = item.value
    end
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
