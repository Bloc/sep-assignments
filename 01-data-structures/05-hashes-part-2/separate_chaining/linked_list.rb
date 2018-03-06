require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    # start @ head
    current = @head

    #if list is empty, set head to node
    #else find curent tail and set it's next to node
    if(!current)
      @head = node
      current = node
    else
      find_tail.next = node
    end

    #set tail to node value
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head

    #find node before tail & set this to new tail
    @tail = find_before(find_tail)

    #if tail exists, set next tail.next to nil
    if @tail
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    elements = []
    current = @head

    while(current)
      puts "#{current.data}"
      current = current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    #if node = head, call remove front
    #else find node before
    if @head.data == node.data
      self.remove_front
    else
      node_before = find_before(node)
      node_before.next = node_before.next.next
    end
    @tail = find_tail
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = @head
    @head = node
    @head.next = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end

  def find_before(node)
    current = @head

    #return nil if value is head, there is no before node
    return nil if !current.next

    #return head if the head's next == node
    return @head if current.next == node

    #otherwise traverse the list
    while(current.next)
      return current if current.next && current.next.data == node.data
      current = current.next
    end
  end

  def find_tail
    current = @head
    return current if current.next.nil?

    while(current.next)
      current = current.next
    end
    current
  end
end
