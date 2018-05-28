require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.tail
      self.tail.next = node
    end
    if self.head == nil
      self.head = node
    end
    self.tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp_node = self.head

    while temp_node
      if self.head == self.tail
        self.head = nil
        self.tail = nil
      elsif temp_node.next == self.tail
        self.tail = temp_node
        temp_node.next = nil
      end
        temp_node = temp_node.next
    end
  end

  # This method prints out a representation of the list.
  def print
    temp_node = self.head

    while temp_node
      puts temp_node.data
      temp_node = temp_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp_node = self.head

    if self.head == node && self.tail == node
      self.head = nil
      self.tail = nil
    elsif self.head == node
      self.head = temp_node.next
      temp_node = nil
    end

    while temp_node
      if temp_node.next == node && self.tail == node
        temp_node.next = node.next
        self.tail = temp_node
      elsif temp_node.next == node
        temp_node.next = node.next
      end

      temp_node = temp_node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head
    self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp_node = self.head
    self.head = temp_node.next
    temp_node.next = nil
    temp_node
  end
end
