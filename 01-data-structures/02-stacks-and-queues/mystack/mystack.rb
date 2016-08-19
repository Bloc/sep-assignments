class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    #self contains a reference to the current object which is @stack
    self.top = nil
    #create variable to locate index position to push/pop element
    ###Question: passing tests with 0, but should this be -1? Can it be -1??
    @stack_position = 0
  end
  #Stack is LIFO, so adding and removing will be to the first index position in the array
  def push(item)
    #use stack position index and increment by 1,
    @stack_position +=1
    #assign element to location at the stack position index
    @stack[@stack_position] = item
    self.top = item
  end

  def pop
    #assign the element at the stack position index to temp
    temp = @stack[@stack_position]
    #then decrement the stack position index by 1
    @stack_position -=1
    #assign top element to decremented position
    self.top = @stack[@stack_position]
    #return temp
    return temp
  end

  def empty?
    #if array length is zero, then it is empty
    if @stack.length == 0
      true
    else
      false
    end
  end
end
