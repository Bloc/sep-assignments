class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    item = @head
    @queue = @queue[1..-1]
    @head = @queue[0]
    @tail = @queue[-1]
    item
  end

  def empty?
    @queue.length == 0
  end
end
