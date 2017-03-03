require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

	# my_hash["key"] = "value"
		
	def []=(key, value)
		index = indeces(key, @items.length)
		hashed_item = @items[index]
		if hashed_item.nil?
			@items[index] = HashItem.new(key, value)
		elsif hashed_item.key != key
			resize
			self[key] = value
		elsif hashed_item.key == key && hashed_item.value != value
			resize
			hashed_item.value = value
		end
	end

	# my_value = my_hash["key"]
	
	def [](key)
		new_index = indeces(key, @items.length)
		if @items[new_index]
			return @items[new_index].value
		end
	end
	

  def resize
		twice_size = @items.size * 2
		new_array = Array.new(twice_size)
		@items.each do |hashitem|
			if hashitem != nil
				new_array[indeces(hashitem.key, twice_size)] = hashitem
			end
		end
		@items = new_array
  end
	
  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def indeces(key, size)
		sum = 0
		key.each_byte { |x| sum += x }
		return sum % size
		# "cat" => 78 + 76 + 84
  end

  # Simple method to return the number of items in the hash
  def size
		return @items.size
  end
	
end