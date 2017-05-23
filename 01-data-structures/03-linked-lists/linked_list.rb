require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head
      i = @head
      while i.next
        i = i.next
      end
      i.next = node
    else
      @head = node
    end
    @tail = node
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
      i = @head
      while i.next.next
        @tail = i.next
        i = i.next
      end
      i.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    i = @head
    while i
      puts i.data
      i = i.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      @head = @head.next
    else
      i = @head
      while i
        if i.next == node
          i.next = i.next.next
          unless i.next; @tail = i end
        end
        i = i.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end
end