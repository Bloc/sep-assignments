class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  #Element Assignment
  def []=(key, value)
    #get index from hashing algorithm
    index = self.index(key, self.size)

    #if index already exists: Is it a duplicate value? - if so do nothing, else resize then store key,value pair
    if @items[index]
      if @items[index][1] != value
        until @items[index].nil?
          self.resize
          index = self.index(key, self.size)
        end
        @items[index] = [key, value]
      end
    else
      @items[index] = [key, value]
    end

    #if index already exists: Is it a duplicate value? - if so do nothing, else resize until index is open then store key,value pair
    # if @items[index]
    #   #if index already exists and its a duplicate value  => return (do nothing to array)
    #   if @items[index][1] == value
    #     return
    #   else
    #     #otherwise resize internal array & recalc index until index[value] == nil
    #     while @items[index]
    #       self.resize
    #       index = self.index(key, self.size)
    #     end
    #   end
    # end
    # #once @items[index] (is open) => store key value pair in array at open index
    # @items[index] = [key, value]

    print "\n Hash size: #{self.size} \n Internal Array: #{@items} \n"
  end

  #Element Reference
  def [](key)
    index = self.index(key, self.size)
    @items[index][1]
  end

  def resize
    #copy of current Array
    temp_array = Marshal.load(Marshal.dump(@items))

    #create items array double the size
    current_size = self.size
    @items = Array.new(current_size * 2)

    #rehash keys
    #for each element in temp, get key & value and then recall def []=(key, value)
    temp_array.each { |e|
      unless e.nil?
        index = self.index(e[0], self.size)
        @items[index] = [e[0], e[1]]
      end
    }
    print "\n HASH RESIZING! \n Hash size: #{self.size} \n Internal Array: #{@items} \n"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
