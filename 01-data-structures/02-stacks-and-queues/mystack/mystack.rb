class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @top = item
    @stack[@stack.length] = item
  end

  def pop
    p = @top
    @stack.delete(@top)
    @top = @stack[-1]
    return p
  end

  def empty?
    if @stack.length == 0
      true
    else
      false
    end
  end
end
