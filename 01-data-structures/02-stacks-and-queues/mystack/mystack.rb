class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item;
    self.top = item;
  end

  def pop
    deletedItem = self.top;
    @stack.delete(@stack.last)
    self.top = @stack.last;

    return deletedItem
  end

  def empty?
    if @stack.length < 1
      true;
    else
      false;
    end
  end
end
