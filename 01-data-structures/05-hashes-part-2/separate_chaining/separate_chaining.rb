require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.tail
      self.tail.next = node
      self.tail = node
    else
      self.tail = node
      self.head = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == self.tail
      self.tail = nil
      self.head = nil
    elsif self.head != nil
      current = self.head
      while current.next != self.tail
        current = current.next
      end
      current.next = nil
      self.tail = current
    end
  end

  # This method prints out a representation of the list.
  def print
    if self.head != nil
      current = self.head
      while current != nil
        current = current.next
      end
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head != nil
      if node == self.head
        remove_front
      elsif node == self.tail
        remove_tail
      else
        current = self.head
        while current.next != nil && current.next != node
          current = current.next
        end
        temp = current.next.next
        current.next = nil
        current.next = temp
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head == nil
      self.head = node
      self.tail = node
    else
      node.next = self.head
      self.head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head == self.tail
      remove_tail
    else
      temp = self.head.next
      self.head = nil
      self.head = temp
    end
  end
end

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key, size)
    item_link = LinkedList.new
    item = Node.new(key, value)
    if @items[index]
      @items[index].add_to_tail(item)
    else
      @items[index] = item_link
      item_link.add_to_tail(item)
    end
    check_load
  end

  def check_load
    if load_factor > @max_load_factor
      resize
    else
      true
    end
  end

  def [](key)
    @items.each do |item|
      if !item.nil?
        current_item = item.head
        while current_item
          if current_item.key == key
            return current_item.value
          end
          current_item = current_item.next
        end
      end
    end
  end

  def index(key, size)
    return key.sum % size
  end

  def load_factor
    items_count = 0
    @items.each do |item|
      if item
        current_item = item.head
        while current_item
          items_count += 1
          current_item = current_item.next
        end
      end
    end
    return items_count.to_f / size.to_f
  end

  def size
    counter = 0
    @items.each do |item|
      counter += 1
    end
    return counter
  end

  def resize
    @items[@items.size * 2 - 1] = nil
    temp = []
    @items.each_with_index do |item, index|
      if item
        temp.push(item)
        @items[index] = nil
      end
    end
    
    temp.each do |item|
      index = index(item.head.key, size)
      @items[index] = item
    end
  end
  
  def status
    puts "the load factor is #{load_factor}"
    @items.each_with_index do |list, index|
      if list
        puts "these movies are at index #{index}:"
        if list.head.next
          current_item = list.head
          while current_item.next
            puts "#{current_item.key}"
            current_item = current_item.next
          end
        else
          puts list.head.key
        end
      else
        puts "there is nothing at index: #{index}"
      end
    end
  end
end
