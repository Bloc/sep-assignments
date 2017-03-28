class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = @stack.last
  end

  def pop
    last = @stack.last
    @stack.slice!(@stack.length - 1)
    self.top = @stack.last
    last
  end

  def empty?
    @stack.length == 0 ? true : false;
  end
end
