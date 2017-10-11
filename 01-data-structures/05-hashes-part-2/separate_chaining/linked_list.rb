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
    @head = node unless @head
    @tail.next = node if @tail
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
    else
      current = @head
      while current.next != @tail
        current = current.next
      end
      current.next = nil
      @tail = current
    end
  end

  # This method prints out a representation of the list.
  def print
    count = 0
    current = @head
    while current.next != nil
      count += 1
      current = current.next
    end
    count += 1
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @head
      remove_front
    elsif node == @tail
      remove_tail
    else
      current = @head
      prevNode = @head
      until current == node
        prevNode = current
        current = current.next      
      end
      prevNode.next = current.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    @tail = node unless @tail
    current = @head
    if current
      node.next = current
    end
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == @tail
      @head = nil
      @tail = nil
    else
      @head = @head.next
    end
  end

  # Searches list for requested node and returns the value or nil if not found
  def find(key)
    return @head.value if @head.key == key
    return @tail.value if @tail.key == key
    current = @head
    prevNode = @head
    until current.key == key      
      prevNode = current
      current = current.next
      return nil unless current
    end
    current.value
  end
end