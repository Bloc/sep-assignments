require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize 
    @tail = tail
    @head = head
  end
  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
      @tail = @head
      @tail.next = nil
    else
      @tail.next = node
      @tail = node
      @tail.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    unless head.nil?
      if @head === @tail
        @tail.next = nil
        @tail = nil
        @head.next = nil
        @head = nil
      elsif @head.next === @tail
        @tail = @head
        @tail.next = nil
      else
        previous = @head
        current = @head.next
        until current === nil
          if current === @tail
            @tail = previous
            @tail.next = nil
            break  
          elsif current != @tail
            previous.next = current.next
            break
          else
            previous = current
            current = current.next
          end
        end
      end
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
    if @head === node && @tail === node
      @tail.next = nil
      @tail = nil
      @head.next = nil
      @head = nil
    elsif @head === node
      @head = @head.next
    else
      previous = @head
      current = @head.next
      until current === nil
        if current === node && current === @tail
          @tail = previous
          break  
        elsif current === node && current != @tail
          previous.next = current.next
          break
        else
          previous = current
          current = current.next
        end
      end  
    end 
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head.nil?
      @head = node
      @tail = @head
      @tail.next = nil
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    unless head.nil?
      temp = @head
      @head = @head.next
      return temp
    end
  end
end