class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @pointer = -1
    # @pointer can be swapped for @stack[-1] to get "tail"
  end

  def push(item)
    @pointer += 1
    @stack[@pointer] = item
    @stack[-1]
    self.top = item
  end

  def pop
    temp = @stack[@pointer]

    @pointer -= 1

    if @pointer < 0
      self.top = nil
    else
      self.top = @stack[@pointer]
    end

    return temp
  end

  def empty?
    self.top.nil?
  end
end
