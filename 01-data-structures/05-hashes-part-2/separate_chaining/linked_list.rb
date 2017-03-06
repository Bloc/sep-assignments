require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
		if @tail
			@tail.next = node
			@tail = node
		else 
			@tail = node
			@head = node
		end
		@tail.next = nil
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
		if @head.next == nil
			@head = nil
			@tail = nil
		elsif @head
			current = @head
			until current.next.next == nil
				current = current.next
			end
			current.next = nil
			@tail = current
		end
  end
	
#	def find(key)
#		if @items(key)
#	end

  # This method prints out a representation of the list.
  def print
		current = @head
		while current != nil
			puts "#{current.data}"
			current = current.next
		end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
		if @head == node
			@head = @head.next
		elsif @tail == node
			self.remove_tail
		elsif @head != node
			current = @head
			until current.next == node
				current = current.next
			end
			current.next = nil
			current.next = @tail
		end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
		node.next = @head
		@head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
		if @head.next == nil
			@head = nil
			@tail = nil
		elsif @head
			@head = @head.next
		end
  end
end