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
    last_element = @stack.delete(@stack.last)
    self.top = @stack[@stack.length - 1]
    return last_element
  end

  def empty?
    @stack.length == 0 ? true : false
  end

end
