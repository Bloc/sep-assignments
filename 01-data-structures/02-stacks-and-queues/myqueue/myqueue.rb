class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @tail = element
    @head = element if @queue.length === 0
    @queue[@queue.length] = element
  end

  def dequeue
    @queue.slice!(0,1)
    @head = @queue[0]
  end

  def empty?
    return true unless @head
    false
  end
end
