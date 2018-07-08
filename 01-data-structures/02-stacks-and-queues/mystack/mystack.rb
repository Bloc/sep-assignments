class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    if @stack.empty?
      @stack[0] = item
      self.top = @stack[0]
    else
      for i in 1..@stack.length
        @stack[i] = @stack[i - 1]
      end
      @stack[0] = item
      self.top = @stack[0]
    end
  end

  def pop
    temp = @stack[0]
    @stack.delete_at(0)
    self.top = @stack[0]
    return temp
  end

  def empty?
    return @stack.length === 0
  end
end