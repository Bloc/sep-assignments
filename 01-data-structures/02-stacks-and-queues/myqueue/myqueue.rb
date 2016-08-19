class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    #add tail pointer,
    @tail = @queue[0]
  end
  #Queue is FIFO, add element to end of list and remove from front of list
  def enqueue(element)
    #add element to the head of the queue
    @queue << element
    #keep a pointer to the head and tail of queue
    @head = @queue[-1]
    @tail = @queue[0]
  end

  def dequeue
    #set temp to the first element
    temp = @queue[0]
    #remove item from end of queue
    @queue.shift
    #return temp
    return temp
  end

  def empty?
    if @queue.length == 0
      true
    else
      false
    end
  end
end
