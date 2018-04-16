class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.insert(0,item)
  end

  def pop
    @stack.shift
  end

  def empty?
    @stack.empty?
  end

  def top
    @stack.first
  end
end
