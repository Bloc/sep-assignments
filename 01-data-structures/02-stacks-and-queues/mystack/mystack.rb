class MyStack
  attr_accessor :top, :stack

  #LIFO Stack

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    stackIndex = stack.length
    stack[stackIndex] = item #add stack to the last index position
    @top = stack.last #set top to last pos in stack array
  end

  def pop
    if !empty? 
      stack.delete_at(stack.length - 1) #deletion 
      @top = stack.last #set top to the new last position after pop deletion
    end
    return @top
  end

  def empty?
    stack.length == 0
  end
end