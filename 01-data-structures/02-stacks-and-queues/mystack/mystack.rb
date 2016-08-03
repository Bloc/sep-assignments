class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.count] = item
    self.top = @stack[-1]
  end

  def pop
    if !empty? 
      temp = @stack[-1]
      @stack.delete_at[-1]
      self.top = @stack[-1]
      return temp
    else
      nil
  end

  def empty?
    @stack.count == 0 ? true : false
  end
end