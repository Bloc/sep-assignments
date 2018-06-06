require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head
      current_node = @head
      while current_node.next
        current_node = current_node.next
      end
      current_node.next = node
      @tail = node
    else
      @head, @tail = node, node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_node = @head
    if @tail === current_node
      @head, @tail = nil, nil
    else
      while current_node.next && @tail != current_node.next
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    list = ""
    current_node = @head
    while current_node.next
      list << "#{current_node.data}\n"
      current_node = current_node.next
    end
    list << "#{current_node.data}\n"
    puts list
  end

  # This method returns the total number of nodes in the list.
  def count
    return 0 if self.is_empty
    current_node = @head
    total = 1
    while current_node.next
      total += 1
      current_node = current_node.next
    end
    total
  end


  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head === node
      @head = node.next
    elsif @tail === node
      current_node = @head
      while current_node.next && @tail != current_node.next
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    else
      current_node = @head
      while current_node.next && node != current_node.next
        current_node = current_node.next
      end
      current_node.next = current_node.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head
      node.next = @head
      @head = node
    else
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end
end

# This method checks if the list is empty. 
def is_empty
  if !@head
    return true
  end
  false
end
