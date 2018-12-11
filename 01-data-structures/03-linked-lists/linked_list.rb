require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def intitialize
    self.head = nil
    self.tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head === nil
      self.head = node
      self.tail = self.head
      self.tail.next = nil
    else 
      #beg. the traversal
      current = self.head
      while current.next != nil
        #as long as it's not the tail continue
        current = current.next
      end
      current.next = node
      self.tail = current.next
      self.tail.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.tail.nil?
      return nil
    elsif self.head.next.nil?
      self.tail = nil
    else
      current_node = self.head
      until current_node.next == self.tail
        current_node = current_node.next
        #Technical Coach
        #continue to run this line `current_node = current_node.next'
        #until 'until current_node.next == self.tail` results in true
        #ME
        #until the "current_node.next == self.tail" results in true
        #the pointer will continue to be used as the current node's pointer
      end
      current_node.next = nil
      self.tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    current = self.head
    puts current.data
    while current.next != nil
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
    node.next = self.head
    self.head.nil? && self.tail.nil? ? (self.head = node && self.tail = node) : self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if (self.head === nil) || (self.head.next === nil) || (self.head === self.tail)
      self.head = nil
    else
      self.head = self.head.next
    end
  end
end