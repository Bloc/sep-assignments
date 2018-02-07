require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    current = @head
    if (@head == nil) && (@tail == nil)
      @head = node
      @tail = node
    else
      until current.next == nil
        current = current.next
      end
      current.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    return nil if @head == nil || @tail == nil
    until (current.next == @tail)
      current = current.next
    end
    @tail = current
    @tail.next = nil
  end

  # This method prints out a representation of the list.
  def print
    current = @head
    while current != nil
      puts current.data
      current = current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head
    if @head == node
      remove_front
    elsif @tail == node
      remove_tail
    else
      until current.next == node
        current = current.next
      end
      current.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
    else
      node.next = @head
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    @head = @head.next
    temp
  end
end
