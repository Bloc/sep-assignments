class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    @top = @stack.last
  end

  def pop
    item = self.top
    if !empty?
      @stack.delete_at(@stack.length-1)
      @top = @stack.last
    end
    item
  end

  def empty?
    @stack.empty?
  end
end