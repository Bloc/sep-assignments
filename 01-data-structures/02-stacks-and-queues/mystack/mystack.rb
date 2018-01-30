class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = item
  end

  def pop
    temp = @stack.slice!(-1)
    self.top = @stack[-1]
    temp
  end

  def empty?
    @stack.length === 0 ? true : false
  end
end
