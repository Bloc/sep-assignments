class Node
  attr_accessor :next, :prev, :data

  def initialize(data)
	@data = data
	@next = nil
	@prev = nil
  end

  def edit_next(next_node)
	self.next = next_node
  end

  def edit_prev(prev_node)
	self.prev = prev_node
  end
end