require_relative 'node'

class OpenAddressing
  def initialize(size)
		@max_load_factor = 1.0
		@item_count = 0.0
		@items = Array.new(size)
  end

  def []=(key, value)
		index = self.index(key, @items.length)
		if @items[index].nil?
			@items[index] = Node.new(key, value)
			@item_count += 1.0
		elsif @items[index].key == key
			if @items[index].value != value
				@items[index].value = value
				if self.next_open_index(0) == -1
					self.resize
				end
			end
		else
			index = self.next_open_index(index)
			if index == -1
				self.resize
				self[key] = value
				@item_count += 1
			elsif @items[index].nil?
				@items[index] = Node.new(key, value)
				@item_count += 1
			elsif @items[index].key == key && items[index].value != value
				@items[index].value = value
			end
		end
  end

  def [](key)
		index = self.index(key, @items.length)
		until index == @items.length
			if @items[index].nil?
				index += 1
			elsif @items[index].key == key
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
		return key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
		(index...@items.length).each do |index|
			if @items[index].nil?
				return index
			else
				return -1
			end
		end
  end

  # Simple method to return the number of items in the hash
  def size
		return @items.size
  end

  # Resize the hash
  def resize
		old_array = @items
		@items = Array.new(old_array.length * 2)
		old_array.each do |item|
			unless item.nil?
				index = self.index(item.key, @items.length)
				if @items[index].nil?
					@items[index] = Node.new(item.key, item.value)
				elsif @items[index].key != item.key
					index = self.next_open_index(index)
					if index == -1
						self.resize
						self[item.key] = item.value
					else
						@items[index] = Node.new(item.key, item.value)
					end
				elsif @items[index].key == item.key && @items[index].value != item.value
					@items[index].value = item.value
				end
			end
		end
  end
end