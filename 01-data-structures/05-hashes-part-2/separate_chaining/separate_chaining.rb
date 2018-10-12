require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0.0
  end

  def []=(key, value)
    index = index(key, size)
    new_node = Node.new(key, value)

    if @items[index] == nil
      @items[index] = new_node

    elsif @items[index].instance_variable_defined?(:@next)
      ll = LinkedList.new(@items[index])
      ll.add_to_tail(new_node)
      @items[index] = ll

    elsif @items[index].instance_variable_defined?(:@head)
      @items[index].add_to_tail(new_node)
    end

     @item_count += 1

     if load_factor > @max_load_factor
       resize
     end

     #hash_status
  end

  def [](key)
    index = index(key, size)

    if @items[index].instance_variable_defined?(:@head)
      current_node = @items[index].head
      until current_node.key == key
        current_node = current_node.next
      end
      return current_node.value
    else
      @items[index].value
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
    @item_count / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    resized_hash = Array.new(size * 2)

    @items.each do |i|
      if i != nil && i.instance_variable_defined?(:@next)
        resized_hash[index(i.key, resized_hash.length)] = i
      elsif i.instance_variable_defined?(:@head)
        resized_hash[index(i.head.key, resized_hash.length)] = i
      end
    end
    @items = resized_hash
  end

  def hash_status
    j = 0
    p "-------------------"
    p "Load Factor: #{load_factor}"
    @items.each do |i|
      if i != nil
        if i.instance_variable_defined?(:@next)
          p i
          p "Index: #{j}"
          p "Key: #{i.key}"
          p "Value: #{i.value}"
          p "~~~~~~~~~~~~~~~~~"
          j += 1
        end
        if i.instance_variable_defined?(:@head)
          p i
          p "Index: #{j}"
          p "Linked List:"
          p i.print
          p "~~~~~~~~~~~~~~~~~"
          j += 1
        end
      end
    end
    p "-------------------"

  end
end
