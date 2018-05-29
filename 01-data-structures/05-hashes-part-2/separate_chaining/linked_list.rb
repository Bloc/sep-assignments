require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = @tail.next
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @tail == @head
      @tail = nil
      @head = nil
    else
      current = @head
      while current.next != @tail
        current = current.next
      end
      @tail = current
    end
  end

  def iterate(&block)
    counter = 0
    current = @head
    while current.next != nil
      yield current unless block.nil?
      current = current.next
      counter += 1
    end
    counter += 1
  end
  # This method prints out a representation of the list.
  def print
    iterate { |item| puts item.value }
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      @head = @head.next
    elsif @tail == node
      remove_tail
    else 
       temp = @head
       while temp.next != node
        temp = temp.next
       end
       temp.next = temp.next.next
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
    first = @head
    @head = @head.next
    return first
  end
end