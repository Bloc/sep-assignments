class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @tail = @queue[-1]
  end

  def dequeue
    if !@queue.empty?
      @queue.shift
      @tail = @queue[-1]
      @head = @queue[0]
  end

  def empty?
    @queue.count == 0 ? true : false
  end
end