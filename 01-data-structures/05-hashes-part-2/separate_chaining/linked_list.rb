require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    return unless node
    self.head ||= node
    self.tail.next = node if self.tail
    self.tail = node
    self.tail.next = nil
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
      end
      current_node.next = nil
      self.tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    node = self.head
    while node != self.tail
      break if node.nil?
      puts node.data
      node = node.next
    end
    puts self.tail.data
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
    self.tail == self.head ? self.head = nil : self.head = self.head.next
  end
end