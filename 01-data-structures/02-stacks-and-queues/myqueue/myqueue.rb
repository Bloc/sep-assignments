class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.push(element)
    @head = @queue[0]
    @tail = @queue.last
  end

  def dequeue
    @queue.shift
    @head = @queue[0]
  end

  def empty?
    return @queue.length == 0
  end
end
