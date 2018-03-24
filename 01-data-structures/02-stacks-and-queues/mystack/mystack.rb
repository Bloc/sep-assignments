class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = @stack[@stack.length - 1]
  end

  def pop
    if @stack.empty?
      nil
    else
      last = @stack[@stack.length - 1]
      @stack.delete_at(@stack.length - 1)
      self.top = @stack[@stack.length - 1]
      return last
    end
  end

  def empty?
    if @stack.length > 0
      false
    else
      true
    end
  end
end