require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def find(index)
    x = 0
    current = @head
    until x == index
      current = current.next
      x +=1
    end
    current
  end
  
  def search_until(thing)
    @current = @head
    until @current.next == thing
      @current = @current.next
    end
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      # search_until(nil)
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @current == @tail
      @head = nil
      @tail = nil
    else
      search_until(@tail)
      @tail = @current
    end
  end

  # This method prints out a representation of the list.
  def print
    @current = @head
    until @current == nil
      puts @current.data
      @current = @current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @head
      remove_front()
    elsif node == @tail
      remove_tail()
    else
        search_until(node)
        @current.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = @head
    @head = node
    @head.next = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    @head.next = nil # This is for memory managment purposes
    @head = temp
  end
end
