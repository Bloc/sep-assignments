require_relative 'node'

class OpenAddressing

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0.0
  end

  def []=(key, value)
    index = self.index(key, size)
    if @items[index].nil?
      @items[index] = Node.new(key, value)      
      @item_count += 1
    elsif self.next_open_index(0) === -1
      self.resize
    else 
      index = self.next_open_index(index)
      if index === -1
        self.resize
        self[key] = value
      elsif @items[index].nil?
        @items[index] = Node.new(key, value)
        @item_count += 1
      end
    end
  end

  def [](key)
    index = self.index(key, size)
    until index === size
      if @items[index].nil?
        index += 1
      elsif @items[index].key === key
        return @items[index].value
      else
        index += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    until index > size
      if index === size
        index = -1
        break
      elsif @items[index].nil?
        break
      else
        index += 1
      end
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.size * 2)
    old_array.each do |pair|
      unless pair.nil?
        index = self.index(pair.key, size)
        if @items[index].nil?
          @items[index] = Node.new(pair.key, pair.value)
        elsif @items[index].key != pair.key
          index = self.next_open_index(index)
        end
      end
    end
    self.status
  end

  def status
    if @item_count === 0.0
        puts "There is no hash."
        puts "Load Factor is 0."
    else
      @items.each do |pair|
          unless pair.nil?
              index = self.index(pair.key, size)
              puts "#{pair} is at Index #{index} and has a value of " + "\"" + "#{pair.value}" + "\"" + "."
          end
      end
      puts "Load Factor is #{@item_count / size}."
    end
  end
end

