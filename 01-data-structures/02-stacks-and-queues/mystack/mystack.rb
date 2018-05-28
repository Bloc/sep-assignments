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
    item = self.top
    @stack = @stack.first (@stack.length - 1)
    self.top = @stack[@stack.length-1]
    item
  end

  def empty?
    @stack.length == 0
  end
end
