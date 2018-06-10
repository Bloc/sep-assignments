class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
     self.top = 0
     @stack[self.top] = item
     i++
  end

  def pop
    len = @stack.length - 1
    item = @stack[len]
    @stack -= [item]
    self.top = len - 1
    return item
  end

  def empty?
    unless @stack.length > 0
  end
end
