require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    #Check if anything is in the list
    if @head == nil && @tail == nil
      @head = node
      @tail = @head
      @tail.next = nil
    elsif @tail == nil
      @tail = node
    else
      @tail.next = node
      @tail = node
    end

  end

  def search_node(node)
    @current = @head
    until @current.next == node
      @current = @current.next
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    # start from beginning and go to tail
    @current = @head
    until @current.next == nil
      @current = @current.next
    end

    # update tail.previous next value to nil
    @new_current = @head
    until @new_current.next == @current
      @new_current = @new_current.next
    end

    # set new tail
    @new_current.next = nil

    # delete old tail
    delete(@current)
  end



  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != nil
      puts current_node.data
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    # find the node using search_node
    @to_delete = search_node(node)
    # if front of list, call remove_front
    if @to_delete == @head
      remove_front
    # if end of list, call remove_tail
    elsif @to_delete.next == nil
      remove_tail
    end
    # if middle, remove and update next on previous
      # set previous next value
      # delete node
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil && @tail == nil
      @head = node
      @tail = @head
      @tail.next = nil
    else
      current_node = @head
      @head = node
      @head.next = current_node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == nil
      return @head
    else
      current_node = @head
      @head = @head.next
      return current_node
    end
  end
end
