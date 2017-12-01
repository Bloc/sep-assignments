require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @tail.next = node if !@tail.nil?
    @tail = node
    @tail.next = nil
    @head = node if @head.nil?
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if (@head === @tail)
      @head = nil
      @tail = nil
      return
    end

    @this_node = @head
    @new_tail_node = @head

    until @this_node.next.nil? do
      @this_node = @this_node.next
      @new_tail_node = @this_node if !@this_node.next.nil?
    end
    @new_tail_node.next = nil
    @tail = @new_tail_node
  end

  # This method prints out a representation of the list.
  def print
    @current_node = @head
    while !@current_node.nil? do
      puts"#{@current_node.data}\n"
      @current_node = @current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    @next_node = node.next
    return @head = @head.next if node === @head

    @find_node = @head
    until @find_node.next === node do
      @find_node = @find_node.next
    end
    @before_node = @find_node
    @before_node.next = @next_node
    @tail = @before_node if node === @tail
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end

  def find_value(key)
    @find_node = @head
    until @find_node.key === key || @find_node.next.nil?
      @find_node = @find_node.next
    end
    @find_node.value
  end
end
