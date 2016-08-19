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

end



#
#   def []=(key, value)
#     i = index(key, @items.size)
#     n = Node.new(key, value)
#
#     # COLLISION!
#     @items[i] != nil ? list = @items[i] : list = LinkedList.new
#
#     list.add_to_tail(n)
#     @items[i] = list
#     @item_count = @item_count + 1
#
#     # Resize the hash if the load factor grows too large
#     if load_factor.to_f > max_load_factor.to_f
#       resize
#     end
#   end
#
#   def [](key)
#     list = @items.at(index(key, @items.size))
#     if list != nil
#       curr = list.head
#       while curr != nil
#         if curr.key == key
#           return curr.value
#         end
#         curr = curr.next
#       end
#     end
#   end
#
#   # Returns a unique, deterministically reproducible index into an array
#   # We are hashing based on strings, let's use the ascii value of each string as
#   # a starting point.
#   def index(key, size)
#     sum = 0
#
#     key.split("").each do |char|
#       if char.ord == 0
#         next
#       end
#
#       sum = sum + char.ord
#     end
#
#     sum % size
#   end
#
#   # Calculate the current load factor
  # def load_factor
  #   @item_count / self.size.to_f
  # end
#
#   # Simple method to return the number of items in the hash
#   def size
#     @items.size
#   end
#
#   # Resize the hash
#   def resize
#     new_size = size*2
#     new_items = Array.new(new_size)
#     (0..@items.size-1).each do |i|
#       list = @items[i]
#       if list != nil
#         curr = list.head
#         # We only need to compute the new index once
#         new_index = index(curr.key, new_items.size)
#         while curr != nil
#           list = LinkedList.new
#           list.add_to_tail(curr)
#           new_items[new_index] = list
#           curr = curr.next
#         end
#       end
#     end
#
#     @items = new_items
#   end
# end
