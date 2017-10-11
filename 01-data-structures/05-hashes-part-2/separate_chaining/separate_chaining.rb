require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    index = index(key, @size)
    @items[index] ||= LinkedList.new
    node = Node.new(key, value)
    @items[index].add_to_front(node)
    resize if self.load_factor > @max_load_factor
  end

  def [](key)
    index = index(key, @size)
    @items[index].find(key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    counter = 0.0
    @items.each do |item|
      next unless item
      counter += item.print
    end
    counter / @size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size *= 2
    old_arr = @items
    @items = Array.new(@size)
    old_arr.each do |item|
      next unless item
      current = item.head
      while current.next
        self[current.key] = current.value
        current = current.next
      end
      self[current.key] = current.value
    end
  end

  def state
    index = 0
    @items.each do |item|
      if item
        puts "index #{index}:"
        current = item.head
        mem_location = current.object_id
        while current.next
          puts "key: #{current.key} -- value: #{current.value} -- memory: #{mem_location}"
          current = current.next
          mem_location = current.object_id
        end
        puts "key: #{current.key} -- value: #{current.value} -- memory: #{mem_location}"
      else
        puts "index #{index}: is nil"
      end
      index += 1
    end
    puts "load factor: #{self.load_factor}"
    return
  end
end

movies = SeparateChaining.new(5)

movies["Star Wars: The Phantom Menace"] = "Number One"
movies["Star Wars: Attack of the Clones"] = "Number Two"
movies["Star Wars: Revenge of the Sith"] = "Number Three"
movies["Star Wars: A New Hope"] = "Number Four"
movies["Star Wars: The Empire Strikes Back"] = "Number Five"
movies["Star Wars: Return of the Jedi"] = "Number Six"