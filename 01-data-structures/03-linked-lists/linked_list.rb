require_relative 'node'


class LinkedList
  attr_accessor :head
  attr_accessor :tail


  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  #passing in data instead of node as argument
  def add_to_tail(data)
        #if both head and tail are nil, data moves into @head
        if @head == nil && @tail == nil
            @head = data
            @tail = @head
            @tail.next = nil
        #if only tail is nil, and @head has data, the new data inserts into @tail
        elsif @tail == nil
            @tail = data
        #if both head and tail have data, use next to move to next node and insert data
        else
            @tail.next = data
            @tail = data
        end
    end
  # This method removes the last node in the lists and must keep the rest of the list intact.
  #describe "#remove_tail" do
    #it "removes nodes from the tail" do
      #llist.add_to_tail(n1)
      #llist.add_to_tail(n2)
      #expect(llist.tail).to eq n2
      #llist.remove_tail
      #expect(llist.tail).to eq n1
      #llist.remove_tail
      #expect(llist.tail).to eq nil
    #end
  #end
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
      return nil
    end
  end

  # This method prints out a representation of the list.
  def print
    #identify current_node
    current_node = @head
    #iterate through nodes until node is nil
    while current_node != nil
      #print the value of current_node
      puts current_node.data
      #move to next node
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    #if head and tail are empty, @head becomes node
    if @head == nil && @tail == nil
        @head = node
        #@tail is equal to @node
        @tail = @head
        #confirm node is now head, by setting tail to nil
        @tail.next = nil
      else
        #if @head is not empty
        current_node = @head
        #head becomes node
        @head = node
        #current node which was once the head becomes the next node
        @head.next = current_node
      end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    #meets test of @head equal nil
    if @head == nil
      return @head
    #set head to current node
    else
      current_node = @head
      #change head to next node
      @head = @head.next
      #return current_node which is now nil
      return current_node
    end
  end
end
