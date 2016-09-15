class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    @queue.unshift(element)
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    @queue.shift
  end

  def empty?
    return @queue.length == 0
  end
end
