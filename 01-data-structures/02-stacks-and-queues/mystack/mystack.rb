class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.insert(0, item)
    return self.top = @stack.first
  end

  def pop
    @stack.join(',')
    popped = @stack.delete_at(0)
    @stack.join(',')
    self.top = @stack.first
    return popped
  end

  def empty?
    return @stack.count === 0
  end
end