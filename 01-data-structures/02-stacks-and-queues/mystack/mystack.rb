class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
     @top = item 
     @stack[(@stack.length)] = @top
      
  end

  def pop
      temp = @stack[(@stack.length - 1)]
      @stack.delete_at(@stack.length - 1)
      @top = @stack[(@stack.length - 1)]
      return temp
  end

  def empty?
      if @stack.length == 0
          return true
      else
          return false
      end
  end
end
