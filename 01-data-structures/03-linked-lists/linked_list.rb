require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
      @tail = @head
      @tail.next = nil
    else
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = node
      @tail = node
      @tail.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head = nil
      @tail = nil
    else
      node = @head
      while node.next.next != nil
        node = node.next
      end
      node.next = nil
      @tail = node
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = Array.new
    current_node = @head
    temp << current_node.data
    while current_node.next != nil
      current_node = current_node.next
      temp << current_node.data
    end
    temp.each {|str| puts "#{str}"}
  end

  def print_at(number)
    current_node = @head
    for i in 0..number
      if i === number
        puts current_node.data
      end
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head === node
      @head = @head.next
      node.next = nil
    else
      current_node = @head
      while current_node.next != node
        current_node = current_node.next
      end
      if @tail != node
        current_node.next = current_node.next.next
      else
        current_node.next = nil
        @tail = current_node
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    node = @head
    @head = @head.next
    node.next = nil
  end
end