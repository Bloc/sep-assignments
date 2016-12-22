class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.size] = item
    @top = item
  end

  def pop
    result = top
    @stack.delete_at(@stack.size - 1)
    @top = @stack[@stack.size - 1]
    result
  end

  def empty?
    @stack.empty?
  end
end
