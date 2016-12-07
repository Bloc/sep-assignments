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
    key.sum % size
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
    current_load_factor = @item_count / self.size.to_f
    puts "Current load factor is #{current_load_factor}"
    @items.inspect
  end

end


def test_function
  # require "./separate_chaining/separate_chaining.rb"

  star_wars_movies = SeparateChaining.new(6)
  star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
  star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
  star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
  star_wars_movies["Star Wars: A New Hope"] = "Number Four"
  star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
  star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"
  star_wars_movies.print()
end

# test_function()
