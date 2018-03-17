class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue.last
  end

  def dequeue
    item = @queue[0]
    @queue.delete(item)
    @head = @queue[0]
    @tail = @queue.last
    return item
  end

  def empty?
    @queue.length == 0
  end
end
