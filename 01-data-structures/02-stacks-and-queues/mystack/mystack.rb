class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @top = @stack.length - 1
    @stack << item
    @top = @stack[@stack.length - 1]
  end


  def pop
    raise "Stack is empty" if self.empty?
    lastIndex = @stack.length - 1
    temp = @stack.delete_at(lastIndex)
    @top = @stack[lastIndex - 1]
    temp
  end

  def empty?
    if @stack.length > 0
      false
    end
  end
end
