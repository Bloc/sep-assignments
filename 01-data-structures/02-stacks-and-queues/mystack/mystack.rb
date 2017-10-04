class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    index = @stack.length
    @stack[index] = item
    @top = item
  end

  def pop
    temp = @top
    index = @stack.length - 2
    @stack.delete(@top)
    @top = empty? ? nil : @stack[index]
    temp
  end

  def empty?
    @stack.length > 0 ? false : true
  end
end