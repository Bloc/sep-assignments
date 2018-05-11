require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
      @tail = node
    else
      node.prev = @tail
      @tail.next = node
      @tail = @tail.next
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
    else
      @tail = @tail.prev
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    node = @head
    until node == nil
      puts node.data
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      @head = node.next
      @head.prev = nil
    elsif @tail == node
      @tail = node.prev
      @tail.next = nil
    else
      node.prev.next = node.next
      node = nil
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head.next == nil
      @head = nil
    else
      @head = @head.next
      @head.prev = nil
    end
  end
end