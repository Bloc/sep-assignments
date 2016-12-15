require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    i = index(key, @items.size)
    n = Node.new(key, value)

    # COLLISION!
    @items[i] != nil ? list = @items[i] : list = LinkedList.new

    list.add_to_tail(n)
    @items[i] = list
    @item_count = @item_count + 1

    # Resize the hash if the load factor grows too large
    if load_factor.to_f > max_load_factor.to_f
      resize
    end
  end

  def [](key)
    list = @items.at(index(key, @items.size))
    if list != nil
      curr = list.head
      while curr != nil
        if curr.key == key
          return curr.value
        end
        curr = curr.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0

    key.split("").each do |char|
      if char.ord == 0
        next
      end

      sum = sum + char.ord
    end

    sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_size = size*2
    new_items = Array.new(new_size)
    (0..@items.size-1).each do |i|
      list = @items[i]
      if list != nil
        curr = list.head
        # We only need to compute the new index once
        new_index = index(curr.key, new_items.size)
        while curr != nil
          list = LinkedList.new
          list.add_to_tail(curr)
          new_items[new_index] = list
          curr = curr.next
        end
      end
    end

    @items = new_items
  end

  def print
    puts
    (0..@items.size-1).each do |x|
      list = "index #{x}: "
      if @items[x] == nil
        list += 'empty'
      else
        i = 1
        currentValue = @items[x].head
        list += "##{i} in list: "
        list += "#{currentValue.key}, #{currentValue.value}."
        while currentValue.next
          currentValue = currentValue.next
          i += 1
          list += "  ##{i} in list: "

          list += "#{currentValue.key}, #{currentValue.value}."
        end
      end
      puts list
    end
    puts "Load factor: #{load_factor}"
  end
end

=begin
  the output for:
    star_wars_movies = SeparateChaining.new(6)
    star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
    star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
    star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
    star_wars_movies["Star Wars: A New Hope"] = "Number Four"
    star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
    star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"
    star_wars_movies.print

  is:
  index 0: empty
  index 1: empty
  index 2: #1 in list: Star Wars: The Empire Strikes Back, Number Five.
  index 3: #1 in list: Star Wars: Attack of the Clones, Number Two.  #2 in list: Star Wars: Return of the Jedi, Number Six.
  index 4: #1 in list: Star Wars: A New Hope, Number Four.
  index 5: empty
  index 6: #1 in list: Star Wars: The Phantom Menace, Number One.
  index 7: empty
  index 8: empty
  index 9: empty
  index 10: empty
  index 11: #1 in list: Star Wars: Revenge of the Sith, Number Three.
  Load factor: 0.5

= end
