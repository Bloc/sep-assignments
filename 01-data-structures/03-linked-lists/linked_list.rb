require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.tail
      self.tail.next = node
      self.tail = node
    else
      self.tail = node
      self.head = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == self.tail
      self.tail = nil
      self.head = nil
    elsif self.head != nil
      current = self.head
      while current.next != self.tail
        current = current.next
      end
      current.next = nil
      self.tail = current
    end
  end

  # This method prints out a representation of the list.
  def print
    if self.head != nil
      current = self.head
      while current != nil
        puts current.data
        current = current.next
      end
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head != nil
      if node == self.head
        remove_front
      elsif node == self.tail
        remove_tail
      else
        current = self.head
        while current.next != nil && current.next != node
          current = current.next
        end
        temp = current.next.next
        current.next = nil
        current.next = temp
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head == nil
      self.head = node
      self.tail = node
    else
      node.next = self.head
      self.head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head == self.tail
      remove_tail
    else
      temp = self.head.next
      self.head = nil
      self.head = temp
    end
  end
end