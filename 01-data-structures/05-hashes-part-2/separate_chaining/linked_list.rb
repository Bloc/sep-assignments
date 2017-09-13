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
    current = @head
    if @tail.nil?
      @tail = node
    elsif @tail
      temp = @tail
      temp.next = node
      @tail = node
      @tail.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    if @tail.nil?
      return nil
    elsif @head.next.nil?
      @tail = nil
    else
      until current.next == @tail
        current = current.next
      end
      current.next = nil
      @tail = current
    end
  end

  # This method prints out a representation of the list.
  def print
    current = @head

    puts current.data

    until current.next == nil
      current = current.next
      puts current.data
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      remove_front
    elsif @tail == node
      remove_tail
    else
      current = @head
      until current.next == node
        current = current.next
      end
      current.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if ((@head == nil) && (@tail == nil))
      @head = node
      @head.next = nil
      @tail = node
      @tail.next = nil
    else
      current = @head
      @head = node
      @head.next = current
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @tail == @head ? @head = nil : @head = @head.next
  end

end
