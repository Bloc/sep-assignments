class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.insert(@stack.length,item)
    self.top = @stack.last
  end

  def pop
    item = @stack.last
    @stack.delete_at(@stack.length-1)
    self.top = @stack.last
    return item
  end

  def empty?
    @stack.empty?
  end
end
