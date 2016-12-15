require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end


  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = @tail = nil
    else
      placeholder = @head
      while placeholder.next != @tail
        placeholder = placeholder.next
      end
      placeholder.next = nil
      @tail = placeholder
    end
  end


  # This method prints out a representation of the list.
  def print
    placeholder = @head
    list = ""
    while placeholder.next
      list += placeholder.data + "\n"
      placeholder = placeholder.next
    end
    list += placeholder.data + "\n" # the plus "\n" added because of the way the spec is written.
    printf list
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head.data == node.data
      remove_front
    elsif @tail.data == node.data
      remove_tail
    else
      previousNode = @head
      placeholder = @head.next
      while placeholder.data != node.data
        if placeholder.next
          previousNode = placeholder
          placeholder = placeholder.next
        else
          return 'node not found'
        end
      end
      previousNode.next = placeholder.next
    end
  end


  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    placeholder = @head
    @head = placeholder.next
    return placeholder
  end
end
