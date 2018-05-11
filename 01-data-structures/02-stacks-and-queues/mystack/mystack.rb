class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    @top = nil
    @counter = -1
  end

  def push(item)
    @counter += 1
    @top = item
    @stack[@counter] = @top
  end

  def pop
    temp = @top
    @stack[@counter] = nil
    @counter -= 1
    @top = @stack[@counter]
    return temp
  end

  def empty?
    if @counter < 0 
      return true
    else
      return false
    end
  end
end