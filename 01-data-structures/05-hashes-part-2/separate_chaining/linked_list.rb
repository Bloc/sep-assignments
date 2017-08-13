require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.tail == nil
      self.tail = node
      self.head = node
      node.next = nil
      return
    end
    
    old_tail = self.tail
    old_tail.next = node
    node.next = nil
    self.tail = node
  end
  
  def add_to_front(node)
    puts "Here I am"
    self.print
    node1 = self.head
    self.print
    self.head = node
    self.print
    node.next = node1
    self.print
    if node1 == nil
      self.tail = node
      self.print
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    retval = self.tail
    if self.head == self.tail
      self.head = nil
      self.tail = nil
      return retval
    end
    node = self.head
    until node.next == retval do
      node = node.next
    end
    node.next = nil
    self.tail = node
    return retval
  end

  # This method prints out a representation of the list.
  def print
    retval = "["
    node = self.head
    until node == nil do
      retval += "#{node.value}"
      node = node.next
      if node != nil
        retval += ", "
      end
    end
    retval += "]"
    puts retval
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == self.head
      if self.head == self.tail
        self.head = nil
        self.tail = nil
        node.next = nil
        return node
      end
      self.head = node.next
      node.next = nil
      return node
    end
    
    self.print
    
    node1 = self.head
    until node1.next == node do
      if node1.next == nil
        return nil # not on the list
      end
      node1 = node1.next
    end
    
    node1.next = node.next
    if node == self.tail
      self.tail = node1
    end

    node.next = nil
    return node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    node = self.head
    if node == self.tail
      self.tail = nil
    end
    self.head = node.next
    node.next = nil
    return node
  end
end