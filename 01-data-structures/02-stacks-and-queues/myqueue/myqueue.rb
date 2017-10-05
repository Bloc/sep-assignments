class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    index = @queue.length
    @queue[index] = element
    @head = @queue[0]
    @tail = @queue.last
  end

  def dequeue
    @head = @queue[1]
    @queue.delete(@queue.first)
  end

  def empty?
    @queue.length > 0 ? false : true
  end
end