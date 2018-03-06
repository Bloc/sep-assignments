require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    #get index from hashing algorithm
    index = self.index(key, self.size)

    #if array[index] is present
      #call next_open_index
      #if returns value => SET array[new_index] to the key,value
      #if we've checked the entire array (ie next_open_index returned -1) THEN
      #   CALL RESIZE
      #   CALL INSERT(key, value)
      #   RETURN
      # END IF
    #END WHILE
    # SET array[index] to the new key and value
    # END DEF

    if @items[index]
      next_index = self.next_open_index(index)
      if next_index == -1
        self.resize
        self[key] = value
        return
      else
        @items[next_index] = [key, value]
      end
    else
      @items[index] = [key, value]
    end

    items_present = @items.count{ |x| !x.nil? }
    load_factor = (items_present.to_f)/(self.size.to_f)
    print "\n Load Factor: #{load_factor} \n Internal Array: #{@items} \n"
  end

  def [](key)
    @items.each_with_index do |arr, index|
      unless arr.nil?
        if arr.include?(key)
          return @items[index][1]
        end
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
    starting_index = index

    #while index is occupied
      #if index >= items.length - 1, go to beginning of the array and loop until you get back to starting index
    #if index is open => return this index
    #if you have looped through entire array and no spots are open => return -1

    while @items[index]
      if index >= @items.length - 1
        index = -1
      end
      index += 1
      break if index == starting_index
    end
    index == starting_index ? -1 : index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
print "\n Hash before resizing! \n Hash size: #{self.size} \n Internal Array: #{@items} \n"
    #copy of current Array
    temp_array = Marshal.load(Marshal.dump(@items))

    #create items array double the size
    @items = Array.new(self.size * 2)

    #rehash keys
    #for each element in temp, get key & value and then recall def []=(key, value)
    temp_array.each { |e|
      unless e.nil?
        index = self.index(e[0], self.size)
        @items[index] = [e[0], e[1]]
      end
    }
    print "\n HASH AFTER RESIZING! \n Hash size: #{self.size} \n Internal Array: #{@items} \n"
  end
end
