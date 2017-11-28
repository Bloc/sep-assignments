class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue += [(element)]
    @head = @queue[0]
    @tail = @queue.last
  end

  def dequeue
    @queue.shift
    @head = @queue[0]
    @tail = @queue.last
  end

  def empty?
    @queue.empty? ? (return true) : (return false)
  end
end
