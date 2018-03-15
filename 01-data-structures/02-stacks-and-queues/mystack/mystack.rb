class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    @position = -1
    self.top = nil
  end

  def push(item)
    @position += 1
    @stack[@position] = item
    self.top = @stack[@position]
  end

  def pop
    if !@stack.empty?
      item = @stack[@position]
      @stack.delete_at(@position)
      @position -= 1
      self.top = @stack[@position]
      item
    else
      null
    end
  end

  def empty?
    @stack.length <= 0
  end
end
