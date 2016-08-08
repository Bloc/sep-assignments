class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.count] = item
    self.top = item
  end

  def pop
    if !empty? 
      temp = @stack.delete_at(-1)
      self.top = @stack[-1]
      return temp
    end
  end

  def empty?
    @stack.count == 0
  end
end