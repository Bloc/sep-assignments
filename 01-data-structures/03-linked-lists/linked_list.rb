require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail == nil
      @head = node
      @tail = node
    elsif @tail != @head
      @tail.next = node
      @tail = node
    else
      @tail = node
      @head.next = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp = @head
    if @tail == nil
      return nil
    end

    while (temp.next != nil) && (temp.next != @tail)
      temp = temp.next
    end
    if @head == @tail
      @tail = nil
      @head = nil
    else
      @tail = temp
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = @head
    puts temp.data
    while temp.next != nil
      puts temp.next.data
      temp = temp.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @tail == node
      remove_tail
    elsif @head == node
      @head = @head.next
    else
      temp = @head
      while temp.next != node
        temp = temp.next
      end
      temp.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = @head
    @head = node
    @head.next = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @tail == @head ? @head = nil : @head = @head.next
  end
end
