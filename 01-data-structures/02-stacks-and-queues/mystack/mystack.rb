class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  # avoid using .push command
  def push(item)
    @stack.insert(0,item)
    self.top = item
  end

  # avoid using .pop command
  def pop
    mostRecent = self.top
    @stack.delete(mostRecent)
    self.top = @stack.last
    mostRecent
  end

# avoid using .empty?
  def empty?
    if @stack.length == 0
      return true
    else
      return false
    end
  end

end
