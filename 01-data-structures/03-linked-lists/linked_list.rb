require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head = nil
      self.head = node
      self.tail = node
    else
      self.tail.next = node
      self.node  = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    while current.next.next != nil
      current = current.next
    end
    @tail = current
    @tail.next = nil
  end

  # This method prints out a representation of the list.
  def print
    current = self.head
    puts current.data
    until current = self.tail
      current = current.next
      puts current.data
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head == node
      remove_front
    elsif self.tail == node
      remove_tail
    else
      current_node = self.head
      until current_node.next == node
        current_node = current_node.next
      end
      current_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    unless self.head.nil?
      node.next = self.head
    else
      self.head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    unless self.head.next.nil?
      self.head = self.head.next
    else
      self.head = nil
      self.tail = nil
    end
  end
end
