require_relative 'node'

class LinkedList
  attr_accessor :head,:tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head.nil?

      self.head = node
      self.tail = node

    else
      self.tail.next = node
      self.tail = node
    end
  end

  # This method removes the last node in the list and must keep the rest of the list intact.
  def remove_tail
    if self.head.nil? || self.head.next.nil?
      self.tail = nil
    else
      last_node = self.head
      prev_to_last = nil

      until last_node.next.nil?
        prev_to_last = last_node
        last_node = last_node.next
      end

      prev_to_last.next = nil
      self.tail = prev_to_last
      return prev_to_last
    end
  end

  # This method prints out a representation of the list.
  def print
    output = ""
    current_node = self.head

    until current_node.nil?
      output += current_node.data + "\n"
      current_node = current_node.next
    end

    puts output
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node.data == self.head.data
      remove_front
    elsif node.data == self.tail.data
      remove_tail
    else
      current_node = self.head
      prev_node = nil

      until current_node.data == node.data
        prev_node = current_node
        current_node = current_node.next
      end

      prev_node.next = current_node.next
      current_node.next = nil

      return current_node
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head.nil?
      self.head = node
      self.tail = node
    else
      temp = self.head
      self.head = node
      self.head.next = temp
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head.nil?
      return nil
    else
      temp = self.head
      self.head = self.head.next
      return temp
    end
  end
end
