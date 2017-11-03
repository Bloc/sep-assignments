require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  
  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def size
    length = 0
    if !@head.nil?
      length = 1
      current_node = @head
      while current_node != @tail
        current_node = current_node.next
        length += 1
      end
    end
    return length
  end

  def search_node(key)
    current_node = @head
    while (current_node != nil && current_node.key != key)
      current_node = current_node.next
    end
    current_node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head = nil
      @tail = nil
    else
      current = @head
      while ((current != nil) && (current.next != @tail)) do
        current = current.next
      end
      @tail = current
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current = @head
    while current != nil
      puts "#{current.key}: #{current.value}"
      current = current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head != nil
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
    first_node = @head
    if @head === @tail
      @head = nil
      @tail = nil
    elsif @head != nil
      @head = first_node.next

      if @head.next.nil? #in case there were only two nodes, and we delete the first one, then new_head_node is also the tail node
        @tail = @head
      end
    end
    return first_node
  end
end