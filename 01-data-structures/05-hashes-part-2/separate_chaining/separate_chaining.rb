require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
	attr_reader :item_count

  def initialize(size)
    @max_load_factor = 0.7
		@items = Array.new(size)
		@item_count = 0.0
  end

  def []=(key, value)
		index = self.index(key, @items.length)
		if @items[index].nil?
			llist = LinkedList.new
			@items[index] = llist
		end
		@items[index].add_to_tail(Node.new(key, value))
		@item_count += 1
		if load_factor >= @max_load_factor
			self.resize
		end
  end

  def [](key)
		new_index = self.index(key, @items.length)
		if @items[new_index]
			current = @items[new_index].head
			until current.nil?
				if current.key == key
					return current.value
				else
					current = current.next
				end
			end
		end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
		return key.sum % size
  end

  # Calculate the current load factor
  def load_factor
		@item_count / @items.length
  end

  # Simple method to return the number of items in the hash
  def size
		return @items.size
  end

  # Resize the hash
  def resize
		old_array = @items
		@items = Array.new(old_array.length * 2)
		old_array.each do |ll|
			unless ll.nil?
				current = ll.head
				unless current.nil?
					index = self.index(current.key, @items.length)
					if @items[index].nil?
						@items[index] = LinkedList.new
						@items[index].add_to_tail(Node.new(current.key, current.value))
						if load_factor >= @max_load_factor
							self.resize
						end
						current = current.next
					end
				end
			end
		end
  end
end
