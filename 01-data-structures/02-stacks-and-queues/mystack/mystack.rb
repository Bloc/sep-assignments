class MyStack
  attr_accessor :top
  attr_accessor :stack

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    self.top = item
    stack[stack.length] = item
  end

  def pop
    top_element = self.top
    stack.slice!(-1)
    self.top = stack[stack.length-1]
    top_element
  end

  def empty?
    return true unless self.top
    false
  end
end
