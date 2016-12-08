class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = []
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    @queue.unshift(element)
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    @queue.delete_at(0)
  end

  def empty?
    @queue.length == 0 ? true : false
  end
end
