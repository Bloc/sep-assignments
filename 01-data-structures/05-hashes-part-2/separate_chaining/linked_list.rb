require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    #if there is tail, add node after tail
    if self.tail
      self.tail.next = node
    end
    #if the linked_list is empty
    if self.head.nil?
      self.head = node
    end
    #set the tail to the node
      self.tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    #the case that there is only one linked_list
    if self.head == self.tail
      self.head = nil
      self.tail = nil
    end

    temp_node = self.head
    while temp_node
      if temp_node.next == self.tail
        temp_node.next = nil
        self.tail = temp_node
      end
      temp_node = temp_node.next
    end
  end

  # This method prints out a representation of the list.
  def print
    temp_node = self.head
    while temp_node
      puts "Key:#{temp_node.key}, Value:#{temp_node.value}"
      temp_node = temp_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head == node && self.head == self.tail
      self.head = nil
      self.tail = nil
      return
    elsif self.head == node
      self.head = node.next
      node.next = nil
      return
    end

    temp_node = self.head
    while temp_node
      if temp_node.next == node && temp_node.next == self.tail
        temp_node.next = nil
        self.tail = temp_node
        return
      elsif temp_node.next == node
        temp_node.next = temp_node.next.next
        node.next = nil
        return
      end
      temp_node = temp_node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head
      node.next = self.head
    else
      self.tail = node
    end
      self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head == self.tail
      self.head = nil
      self.tail = nil
    else
      temp_node = self.head
      self.head = self.head.next
      temp_node.next = nil
      temp_node
    end
  end

  def find_value(key)
    temp_node = self.head
    while temp_node
      if temp_node.key == key
        return temp_node.value
      end
      temp_node = temp_node.next
    end

    nil
  end
end
