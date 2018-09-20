require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    node = @head

    while (node.next != nil)
      if @tail == node.next
        @tail = node
      elsif @tail == @head
        @tail = nil
        @head = nil
      end
      node = node.next
    end
  end

  # This method prints out a representation of the list.
  def print
    node = @head

    while (node != nil)
      puts node.data
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    node_list = @head

    while (node_list != nil)
      if node_list.next == node
        node_list.next = node.next
      elsif @head == node
        remove_front
      elsif @tail == node
        remove_tail
      end
      node_list = node_list.next
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
    @head = @head.next
  end
end
