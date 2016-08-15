class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    if @stack.empty?
      @stack[0] = item
    else
      array = [item]
      @stack.each_with_index do |person, index|
        array[index + 1] = @stack[index]
      end
      @stack = array
    end
    self.top = @stack[0]
  end

  def pop
    if @stack.empty?
      return true
    else
      array = []
      new_one = @stack[0]
      @stack.each_with_index do |person, index|
        next if index == 0
        array[index - 1] = person
      end
      @stack = array
    end
    self.top = @stack[0]
    new_one
  end

  def empty?
    if @stack.length == 0
      return true
    else
      return false
    end
  end
end
