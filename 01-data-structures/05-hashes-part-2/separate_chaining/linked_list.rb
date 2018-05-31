require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize()
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
      @tail = @head
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head = nil
      @tail = nil
    else
      node = @head
      until ((node.nil?) && (node.next.eql?(@tail))) do
        node = node.next
      end
      @tail = node
      @tail.next = nil
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head.eql?(node)
      remove_front
    elsif @tail == node
      remove_tail
    else
      current = @head
      until current.next.eql?(node)
        current = current.next
      end
      current.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
    if @tail.nil?
      @tail = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    node = @head
    if @head.eql?(@tail)
      @head = nil
      @tail = nil
    elsif !@head.nil?
      @head = node.next
      if @head.next.nil?
        @tail = @head
      end
    end
    return node
  end

  def size
    i = 0
    if !@head.nil?
      i = 1
      j = @head
      while !j.eql?(@tail)
        j = j.next
        i += 1
      end
    end
    return i
  end

  # This method prints out a representation of the list.
  def print
    node = @head
    until node.eql?(nil) do
      puts node.data
      node = node.next
    end
  end
end
