class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @items = 0 # The number of items. Not the same as the length, because
              # there might be garabage beyond the last meaningful index
  end

  def push(item) # note, don't want to use built-in push.
    @stack[@items] = item
    @items += 1
    self.top = item
  end

  def pop # note, don't want to use built-in pop.
    value = self.top
    @items -= 1
    
    if @items == 0
      self.top = nil
    else
      self.top = @stack[@items-1]
    end
    return value
  end

  def empty?
    @items == 0
  end
end