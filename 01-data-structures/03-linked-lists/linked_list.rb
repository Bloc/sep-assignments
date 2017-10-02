require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    new_node = Node.new(node)
    if @head == nil
      @head = new_node.data
      @tail = new_node.data
    else
      temp_node = @head
      while temp_node.next != nil
        temp_node = temp_node.next
      end
      @tail = new_node.data
      temp_node.next = @tail
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
    elsif @head.next == @tail
      @head.next = nil
      @tail = @head
    else
      temp_node = @head
      while temp_node.next != @tail
        temp_node = temp_node.next
      end
      @tail = temp_node
    end
  end

  # This method prints out a representation of the list.
  def print
    llist = ""
    temp_node = @head
    llist += temp_node.data + "\n"
    until temp_node == @tail
      temp_node = temp_node.next
      llist += temp_node.data + "\n"
    end
    puts llist
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp_node = @head
    if temp_node == node
      if @head == @tail
        @head = nil
        @tail = nil
      else
        @head = temp_node.next
      end
    else
      while temp_node.next != nil && temp_node.next != node
        temp_node = temp_node.next
      end
      if temp_node.next == @tail
        @tail = temp_node
      else
        node_to_del = temp_node.next
        temp_node.next = node_to_del.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    new_node = Node.new(node)
    if @head == nil
      @head = new_node.data
      @tail = new_node.data
    else
      temp_node = @head
      @head = new_node.data
      new_node.data.next = temp_node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp_node = @head
    if @head == @tail
      @head = nil
      @tail = nil
    else
      temp_node = temp_node.next
      @head = temp_node
    end
    temp_node
  end
end
