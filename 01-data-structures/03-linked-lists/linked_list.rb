require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @ll = Array.new
  end
  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @ll << node
    @head = @ll[0]
    @tail = @ll[@ll.length - 1]
    @tail
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    lastIndex = @ll.length - 1
    temp = @ll.delete_at(lastIndex)

    @tail = @ll[@ll.length - 1]
    @tail
  end

  # This method prints out a representation of the list.
  def print
    @ll.map { |a| puts a.data }

  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = @ll[0]
    i = @ll.index(node)
    @ll.delete_at(i)
    @head = @ll[0]
    @head.next = @ll[1]
    @tail = @ll[@ll.length - 1]

    temp

  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    @ll.unshift(node)
    @head = @ll[0]
    @head.next = @ll[1]
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @ll.delete_at(0)
    @head = @ll[0]
  end
end
