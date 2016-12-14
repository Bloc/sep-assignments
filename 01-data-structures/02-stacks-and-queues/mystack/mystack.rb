class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    @stack_position = -1
    self.top = nil
  end

  def push(item)
    @stack_position += 1
    @stack[@stack_position] = item
    self.top = @stack[@stack_position]
  end

  def pop
    temp = @stack[@stack_position]
    @stack_position -= 1
    if @stack_position >= 0
      self.top = @stack[@stack_position]
    else
      self.top = nil
    end
    temp
  end

  def empty?
    if @stack.length == 0
      true
    else
      false
    end
  end
end
