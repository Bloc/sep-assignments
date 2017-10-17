class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.push(item)
    self.top = item
  end

  def pop
    item = @stack.pop
    self.top = @stack[@stack.length - 1]
    return item
  end

  def empty?
    return @stack.length == 0
  end
end
