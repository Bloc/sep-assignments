class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  # avoid using .push command
  def push(item)
    @stack.insert(0,item)
  end

  # avoid using .pop command
  def pop
    @top = @stack.slice(0)
    @stack = @stack.slice!(1..-1)
    @top
  end

# avoid using .empty?
  def empty?
    if @stack.length == 0
      return true
    else
      return false
    end
  end

  def top
    @stack.slice(0)
  end
end
