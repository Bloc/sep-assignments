require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
	@head = nil
	@tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
	if (self.tail)
		old = self.tail
		old.edit_next(node)
		self.tail = node
		self.tail.edit_prev(old)
	elsif (!self.head && !self.tail)
		self.head = node
		self.tail = node
	end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
	temp = self.tail
	temp.edit_next(nil)
	self.tail = temp.prev
	return self.tail
  end

  # This method prints out a representation of the list.
  def print
	current_node = self.head
	while (current_node)
		puts current_node.data
		last_node = current_node
		current_node = last_node.next
	end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
	if (self.head == node)
		old = self.head
		self.head = old.next
	elsif (self.tail == node)
		new_tail = self.tail.prev
		self.tail = new_tail
	else
		node.prev.edit_next(node.next)
		node.next.edit_prev(node.prev)
	end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
	temp_head = node
	temp_head.edit_next(self.head)
	self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
	new_head = self.head.next
	old_head = self.head
	self.head = new_head
	return old_head
  end

end