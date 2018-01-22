require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def add_to_tail(node)
    tail_node = @tail
    if tail_node
      tail_node.next = node
      @tail = node
    else
      @head = node
      @tail = node
    end

  end

  def remove_tail
    if @tail != @head
      current_node = @head
      previous_node = Node.new(nil)
      while current_node.next != nil do
        previous_node = current_node
        current_node = current_node.next
      end
      previous_node.next = nil
      @tail = previous_node
    else
      @head = nil
      @tail = nil
    end
  end

  def print
    if @head
      current_node = @head
      while current_node.next != nil do
        puts current_node.data
        current_node = current_node.next
      end
      puts current_node.data
    end
  end

  def delete(node)
    if node === @head && @head === @tail
      @head = nil
      @tail = nil
    elsif node === @head
      remove_front
    elsif node === @tail
      remove_tail
    elsif @head
      current_node = @head

      while current_node != node && current_node.next != nil do
        previous_node = current_node
        current_node = current_node.next
      end

      if current_node === node
        previous_node.next = node.next
        node = nil
      else
        nil
      end
    else
      nil
    end
  end

  def add_to_front(node)
    if @head
      node.next = @head
      @head = node
    else
      @head = node
      @tail = node
    end
  end

  def remove_front
    first_node = @head
    @head = first_node.next
    first_node
  end
end
