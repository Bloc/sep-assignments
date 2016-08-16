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
    if self.tail == nil
      self.head = node
      self.tail = node
      node.next = nil
    else
      self.tail.next = node
      self.tail = node
      node.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.tail != nil
      target_node = self.head
      if target_node.next = nil
        self.tail = nil
        self.head = nil
      else
        while target_node.next.next != nil
          target_node = target_node.next
        end
        target_node.next = nil
        self.tail = target_node
      end
    end
  end

  # This method prints out a representation of the list.
  def print
    target_node = self.head
    if target_node == nil
      puts "List empty"
    else
      counter = 0
      puts "Head: #{self.head}"
      puts "Tail: #{self.tail}"
      while target_node
        counter += 1
        puts "Item number #{counter}"
        puts "Node key: #{target_node.key}"
        puts "Node value: #{target_node.value}" 
        puts "Node next: #{target_node.next}"
        target_node = target_node.next
      end
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    target_node = self.head
    if target_node == node
      if target_node.next = nil
        self.head = nil
        self.tail = nil
      else
        self.head = target_node.next
      end
    else
      while target_node.next != node
        if target_node.next == nil
          return false
        else
          target_node = target_node.next
        end
      end
      if target_node.next != nil
        target_node.next = node.next
        if target_node.next == nil
          self.tail = target_node
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head == nil
      self.head = node
      self.tail = node
      node.next = nil
    else
      node.next = self.head
      self.head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head != nil
      target_node = self.head
      self.head = self.head.next
      target_node
    end 
  end
end