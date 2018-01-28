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
    temp = self.top
    @stack = @stack - [self.top]
    self.top = @stack.last
    temp
  end

  def empty?
    @stack.length == 0 ? true : false
  end
end
