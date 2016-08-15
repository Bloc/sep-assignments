require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @temp = @tail
    @node = Node.new(node)
    @tail = @node.data
    @head = @node.data.next #this part confuses the heck out of me...We need to talk about it.
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    @tail = @temp
    @temp = @head #ditto here to the part above
  end

  # This method prints out a representation of the list.
  def print
    puts @temp.data #why can't this work with @head or @node???
    puts @tail.data
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
      if node.data == @tail.data
        #do something
        # @head = node.data
        # @head.next = @temp
        return true
      else
        @head = @temp
        @head.next = @node.data
      end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
  end
end
