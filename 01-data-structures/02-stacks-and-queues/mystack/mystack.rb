class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = @stack.last
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = @stack.last
  end

  def pop
    temp = @stack.last
    @stack.delete(temp)
    self.top = @stack.last
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