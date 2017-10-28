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
    if @tail == nil
      @tail = node
      @head = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @tail == @head
      @tail = nil
      @head = nil
    else
      previous = find_previous(@tail)
      previous.next = nil
      @tail = previous
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = @head
    while temp != nil do
      puts temp.data
      temp = temp.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @head
      remove_front
    elsif node == @tail
      remove_tail
    else
      previous = find_previous(node)
      previous.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end

  def find_by_key(key)
    result = @head
    while result.key != key do
      result = result.next
    end
    return result
  end

  # Counts the number of nodes inside the linked list. 
  def size
    count = 0
    current = @head
    while current != nil do
      count += 1
      current = current.next
    end
    return count
  end

  private
  def find_previous(node)
    temp = @head
    while temp != nil && temp.next != node do
      temp = temp.next
    end
    return temp
  end
end
