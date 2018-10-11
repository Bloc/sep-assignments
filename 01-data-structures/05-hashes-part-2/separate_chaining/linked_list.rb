require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if !@head
      @head = node
      @tail = node
    else
      currentNode = @head

      while(currentNode.next != nil)
        currentNode = currentNode.next
      end

      currentNode.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    currentNode = @head

    while currentNode.next
      previousNode = currentNode
      currentNode = currentNode.next
    end

    if @head.next
      currentNode = nil
      previousNode.next = nil
      @tail = previousNode
    else
      @head = nil
      @tail = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    currentNode = @head

    while currentNode
      puts currentNode.data
      currentNode = currentNode.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    currentNode = @head

    if(node == @head)
      remove_front

    elsif(node == @tail)
      remove_tail

    else

      while currentNode != node
        previousNode = currentNode
        currentNode = currentNode.next
      end

      previousNode.next = currentNode.next
      currentNode = nil
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    old_head = @head
    @head = node
    @head.next = old_head
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    front = @head
    @head = @head.next
    front
  end
end
