class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    @top = item
  end

  def pop
    temp = @top
    top_index = @stack.length - 1
    @stack.slice!(top_index)
    if empty?
      @top = nil
    else
      @top = @stack[top_index - 1]
    end
    temp
  end

  def empty?
    @top == nil || @stack.length < 1
  end
end
