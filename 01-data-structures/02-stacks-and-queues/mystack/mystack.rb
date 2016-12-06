class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    @index = 0
    self.top = nil
  end

  def push(item)
    self.top = item
    @stack[@index] = item
    @index += 1
  end

  def pop
    item = self.top
    if @index > 1
      @index -= 1
      self.top = @stack[@index -1]
    else
      @index = 0
      self.top = nil
    end
    return item
  end

  def empty?
    return self.top == nil
  end
end
