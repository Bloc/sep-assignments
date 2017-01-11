class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.push(item)
    # Since LIFO, new items will be first to be removed. Thus, added item is the 'top'
    self.top = item
  end

  def pop
    # Grab the last element of the stack (i.e. the top)
    popped_item = @stack.pop
    # Since the top was removed, need to reset the top attribute
    self.top = @stack.last
    return popped_item
  end

  def empty?
    @stack.length == 0
  end
end
