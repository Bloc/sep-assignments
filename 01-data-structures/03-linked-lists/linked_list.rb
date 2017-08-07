require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method inserts the node at the end of the list.
  def add_to_tail(node)
    if self.head == nil # if the list is empty, node becomes new head
      self.head = node
    else
      self.tail.next = node # otherwise, is the next node after the previous tail
    end
    node.next = nil # no next
    self.tail = node # it becomes the new tail
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == nil # does nothing to an empty list
      return nil
    end
    
    delete (self.tail) # otherwise, deletes the tail
  end

  # This method prints out a representation of the list.
  def print
    str = ""
    current = self.head
    while current != nil do
      str = "#{str}#{current.data}"
      current = current.next
      if current != nil
        str += "\n"
      end
    end
    puts str
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head == node # if deleting the head, then the second element becomes
                        # the new head
      self.head = node.next
    end

    prev = previous(node) # compute the previous node
    
    if prev != nil
      prev.next = node.next # the previous node now points to the element after node
    end
    
    if self.tail == node # if the node is the last, then the previous becomes the new tail
      self.tail = prev 
    end

    node.next = nil # no longer in the list, so no next
    return node
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head # previous head becomes second, after the node
    self.head = node # the node becomes the new head
    if self.tail == nil
      self.tail = node # if the list was empty, then the node is also the new tail
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    value = self.head # save the first element
    self.head = value.next # the second element becomes the new first element
    value.next = nil # no longer in the list, so no next
    return value
  end
  
  private 
  
  def previous(node) # find the previous node, if any
    current = self.head
    while current != nil do # start at head, go forward until you find the
                            # element whose next is equal to the node
      if current.next == node
        return current
      end
      current = current.next
    end
    return nil # no previous, or node is not actually in the list
  end
  
end