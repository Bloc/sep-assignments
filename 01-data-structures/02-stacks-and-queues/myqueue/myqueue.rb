class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    pointer = @queue.length 
    @tail = element 
    @queue[pointer] = @tail
    @head = @queue[0]
  end

  def dequeue
    @queue.delete_at(0)
    @tail = @queue[-1]
    @head = @queue[0] 
  end

  def empty?
    @queue.length <= 0
  end
end