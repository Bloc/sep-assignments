require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.tail 
      self.tail.next = node 
    end 
    if self.head.nil?
      self.head = node 
    end 
    self.tail = node 
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == self.tail 
      self.head = nil 
      self.tail = nil 
    end 

    node_holder = self.head 
    while node_holder 
      if node_holder.next == self.tail 
        node_holder.next = nil
        self.tail = node_holder 
      end 
      node_holder = node_holder.next 
    end 
  end

  # This method prints out a representation of the list.
  def print 
    node_holder = self.head 
    while node_holder
      puts "Key:#{node_holder.key}, Value:#{node_holder.value}"
      node_holder = node_holder.next 
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
    
    node_holder = self.head 
    while node_holder 
      if node_holder.next == node && node_holder.next == self.tail 
        node_holder.next = nil 
        self.tail = node_holder 
        return 
      elsif node_holder.next == node 
        node_holder.next = node_holder.next.next 
        node.next = nil 
        return 
      end 
      node_holder = node_holder.next 
    end 
  end 

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head 
      node.next = self.head 
    else 
      self.head = node 
    end 
      self.head = node 
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head
      self.head = nil 
      self.tail = nil 
    else 
      node_holder = self.head 
      self.head = self.head.next 
      temp_node.next = nil 
      temp_node 
    end 
  end 

  def get_value(key)
    node_holder = self.head 
    while node_holder 
      if node_holder.key == key 
        return node_holder.value 
      end 
      node_holder = node_holder.next 
    end 
    nil 
  end
end