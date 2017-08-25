class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  # Item added to top of array with unshift, top moves to new index[0].
  def push(item)
    @stack.unshift(item)
    self.top = @stack[0]
  end

  # Marks new top as one under original, removes original.
  def pop
    self.top = @stack[1]
    @stack.shift
  end

  # If stack is empty, comes back as true
  def empty?
    @stack.length == 0
  end
end