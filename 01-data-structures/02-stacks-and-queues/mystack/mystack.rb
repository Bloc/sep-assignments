class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @position = 0
  end

  def push(item)
    @position += 1
    @stack[@position] = item
    self.top = item
  end

  def pop
    temp = @stack[@position]
    @position -=1
    self.top = @stack[@position]
    return temp
  end

  def empty?
    if self.top == nil
      true
    else
      false
    end
  end
end
