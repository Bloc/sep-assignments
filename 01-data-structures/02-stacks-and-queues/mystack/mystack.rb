class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = @stack.last
  end

  def pop
    item = @stack.last
    @stack.delete(@stack.last)
    self.top = @stack.last
    return item
  end

  def empty?
    @stack.length == 0
  end
end
