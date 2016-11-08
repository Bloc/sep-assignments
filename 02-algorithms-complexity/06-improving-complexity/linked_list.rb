require_relative './node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize()
    @head = nil
  end

  def insert(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      target = findlast()
      target.next = new_node
    end
  end

  def findlast()
    current_node = @head
    until current_node.next.nil?
      current_node = current_node.next
    end
    current_node
  end

  def find_remove_smallest()
    if @head.next.nil?
      smallest = @head.data
      @head = nil
      return smallest
    end

    current_node = @head
    smallest = @head.data
    until current_node.next.nil?
      if smallest >= current_node.next.data
        smallest = current_node.next.data
        previous = current_node
      end
      current_node = current_node.next
    end

    if !previous.nil?
      temp = previous.next.next
      previous.next.next = nil
      previous.next = temp
    else
      temp = @head.next
      @head.next = nil
      @head = temp #this was screwed up forever until I discovered it said "heap"
    end
    smallest
  end
end
