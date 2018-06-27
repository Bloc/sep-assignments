class MyStack
  attr_accessor :top, :stack


  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    if self.empty?
      @stack[0], self.top = item, item
    else
      iterations = @stack.length - 1
      for i in iterations..0
        @stack[i+1] = @stack[i]
      end
      @stack[0], self.top = item, item
    end
  end

  def pop
    item = @stack[0]
    @stack.delete_at(0)
    if self.empty?
      self.top = nil
    else
      self.top = @stack[0]
    end
    item
  end

  def empty?
    if self.stack.length > 0
      false
    else
      true
    end
  end
end
