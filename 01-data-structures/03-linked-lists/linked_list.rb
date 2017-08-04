require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil? #if head is nill, set it as nodes inital position
      @head = node
      @tail = @head #since head is first and only, it is also the tail position
    else
      @tail.next = node #set pointer to next pointer 
      @tail = node #set value of the new pointer
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail #if there is only one node
      @head = nil
      @tail = nil
    else
      current = @head # set variable at head / beginning 
      while((!current.nil?) && (current.next != @tail)) do #current is not nil and current.next is not tail
        current = current.next #interate until the point where it is one position behind the tail
      end
      @tail = current #set the tail position to second to last spot
      @tail.next = nil #set final pointer to nil 
    end
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
    if @head === node 
      remove_front
    elsif @tail === node
      remove_tail
    else
      current = @head
      while current != nil && current.next != node 
        current = current.next
      end
      if current.next == node
        current.next = current.next.next
      end
    end
  end


  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if head.nil? 
      @head = node
    elsif 
      node.next = @head
      @head = node 
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    new_head = @head.next
    @head = new_head
  end
end