class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.push(element)
  end

  def dequeue
    @queue.pop
  end

  def empty?
    @queue.empty?
  end

  def head
    @head = @queue.first
  end

  def tail
    @queue.last
  end
end
