class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    pointer = @stack.length 
    @top = item 
    @stack[pointer] = item
  end

  def pop
    popped = @stack[-1]
    @stack.delete_at(-1)
    @top = @stack[-1]
    return popped  
  end

  def empty?
    @stack.length <= 0
  end
end