class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    self.top = item
    @stack << item
  end

  def pop
    temp = self.top
    @stack.delete_at(-1)
    self.top = @stack[-1]
    temp
  end

  def empty?
    if(@stack.length === 0)
      true
    else
      false
    end
  end
end
