class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @stack_position = 0
  end

  def push(item)
    @stack_position += 1
    @stack[@stack_position] = item
    self.top = item
  end

  def pop
    stack_element = @stack[@stack_position]
    @stack_position -= 1
    self.top = @stack[@stack_position]
    return stack_element
  end

  def empty?
    return @stack.length == 0
  end
end
