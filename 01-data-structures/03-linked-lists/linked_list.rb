require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail != nil
      end_node = @tail
      end_node.set_next(node)
      @tail = node
    else
      @head = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    next_to_last = @head
    if next_to_last.next = nil
      next_to_last, @head, @tail = nil, nil, nil
    else
      while next_to_last.next != @tail
        next_to_last = next_to_last.next
      end
      @tail = next_to_last
      delete_me = next_to_last.next
      next_to_last.set_next(nil)
    end 
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != nil
      puts current_node.data
      puts current_node.next
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    # if list exists
    #   if list.
    # track previous, target and next_node
    # find target using previous.next so you dont lose track of it
    # set target to previous.next
    # set next_node to target.next
    # previous.set_next(next_node)
    # 
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head != nil
      temp_head = @head
      node.next = temp_head
      @head = node
    else
      @head = node
      @tail = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head != nil
      temp_head = @head
      @head = temp_head.next
      temp_head
    end
  end
end