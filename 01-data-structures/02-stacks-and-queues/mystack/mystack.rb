class MyStack
  attr_reader :top

  def initialize
    @stack = Array.new
    @pointer = 0
    @top = nil
  end

  def push(item)
    @pointer += 1
    @stack[@pointer] = item
    @top = item
  end

  def pop
    popped = @stack.delete_at(@pointer)
    @pointer -= 1
    @pointer > 0 ? @top = @stack[@pointer] : @top = nil
    popped
  end

  def empty?
    @pointer == 0 ? true : false
  end
end
