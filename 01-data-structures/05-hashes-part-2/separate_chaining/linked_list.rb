require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil # if list does not exist yet, new entry is @head and @tail
      @head = node
      @tail = node
    else # head has a current @tail, set current @tail.next to new node, set new node to @tail
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp = @head #temp hold onto head for beginning iteration
    if temp == @head && temp == @tail
      @head = nil
      @tail = nil
    else
      until temp.next == @tail
        temp = temp.next # now temp will = last, which is @tail
      end
      @tail = temp;
      @tail.next = nil;
    end
  end

  # This method prints out a representation of the list.
  def print
    temp = @head
    i = 1
    until temp.nil?
      puts "key #{i}: #{temp.key}\n"
      puts "value #{i}: #{temp.value}\n"

      temp = temp.next
      i += 1
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head
    if current == @tail
      @head = nil
      @tail = nil
    elsif current == node
      @head = current.next
    elsif @tail == node
      self.remove_tail
    else
      while (current.next != nil) && (current.next != node)
        current = current.next
      end
      unless current.next == nil
        current.next = current.next.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == @tail
      @head = nil
      @tail = nil
    else
      @head = @head.next
    end
  end

  def measure_LS(number)
    i = 0
    while i <= number
      new_head = Node.new("n" + i.to_s)
      self.add_to_tail(new_head)
      i += 1;
    end
    self
  end
end
