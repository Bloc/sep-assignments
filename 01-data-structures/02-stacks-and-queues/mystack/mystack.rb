class MyStack
  attr_accessor :top, :stack

  #LIFO Stack

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    stackIndex = stack.length
    stack[stackIndex] = item #last position becomes items place
    @top = stack.last #set top to last pos in stack array
  end

  def pop
    popItem = @top
    if !empty? 
      stack.delete_at(stack.length - 1) 
      @top = stack.last #set top to the new last position after pop deletion
    end
    return popItem
  end

  def empty?
    stack.length == 0
  end
end