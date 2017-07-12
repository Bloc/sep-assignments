class MyStack
  def initialize
    @stack = Array.new
    @pointer = 0
  end

  def push(item)
    @pointer += 1
    @stack[@pointer] = item
  end

  def pop
    popped = @stack.delete_at(@pointer)
    @pointer -= 1
    popped
  end

  def empty?
    @pointer == 0 ? true : false
  end

  def top
    @stack[@pointer]
  end
end
