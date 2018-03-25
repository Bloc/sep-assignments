class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    temp = @queue.slice!(0)
    @head = @queue[0]
    @tail = @queue[-1]
    temp
  end

  def empty?
    @queue.length === 0 ? true : false
  end
end
