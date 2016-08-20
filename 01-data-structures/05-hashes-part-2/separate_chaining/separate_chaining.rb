require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    index = self.index(key, @items.length)

    if @items[index].nil?
      @items[index] = LinkedList.new()
      @items[index].add_to_tail(Node.new(key,value))
      @item_count +=1
       if load_factor() >= @max_load_factor
         self.resize
      end
    # elsif @items[index].head.key == key
    #   unless @items[index].head.value == value
    #     @items[index].head.value = value
    #     # self.resize #for the spec
    #   end
    else
      @items[index].add_to_tail(Node.new(key,value))
      @item_count +=1
      if load_factor() >= @max_load_factor
        self.resize
      end
    end
  end

  def [](key)
    index = self.index(key, @items.length)

    unless @items[index].nil?
      if @items[index].head.key == key
        @items[index].head.value
      else
        x=0
        until @items[index].find(x).key == key
          x+=1
        end
        @items[index].find(x).value
      end
    end
  end

  def resize
    old_array = @items
    @items = Array.new(@items.length * 2)

    old_array.each do |hash_list|
      unless hash_list.nil?
        x = 0
        until hash_list.find(x) == nil
          index = self.index(hash_list.find(x).key, @items.length)
          if @items[index].nil?
            @items[index] = LinkedList.new()
            @items[index].add_to_tail(Node.new(hash_list.find(x).key, hash_list.find(x).value))
          else
            @items[index].add_to_tail(Node.new(hash_list.find(x).key, hash_list.find(x).value))
          end
          x += 1
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

  def load_factor
    @item_count / self.size.to_f
  end

  def print_all_the_things
    count = 0
    @items.each do |hash_list|
      unless hash_list.nil?
        print "Bucket  #{count} + | "
        x = 0
        until hash_list.find(x) == nil
          puts "(#{x+1}):" + hash_list.find(x).key + " | " + hash_list.find(x).value
          x += 1
        end
      end
      puts "Bucket  #{count} + | "
      count +=1
    end
  end
end
