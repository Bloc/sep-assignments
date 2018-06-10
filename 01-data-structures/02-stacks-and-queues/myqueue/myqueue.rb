class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
      element = @queue[@queue.length]
  end

  def dequeue
    @queue.delete_at(@head)
    @head = @queue[0]
    @tail = @queue.last
  end

  def empty?
    unless @queue > 0
  end
end
