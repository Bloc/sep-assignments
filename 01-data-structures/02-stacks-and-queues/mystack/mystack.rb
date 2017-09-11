class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.unshift(item)
    self.top = @stack.first
  end

  def pop
    while !@stack.empty?
      self.top = @stack.first
      item = @stack.shift

      item
    end
  end

  def empty?
  end
end
