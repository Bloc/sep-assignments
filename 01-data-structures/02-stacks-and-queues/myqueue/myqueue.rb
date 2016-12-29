class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    self.head = @queue[0]
    self.tail = @queue[0]
  end

  def enqueue(element)
    @queue.unshift(element)
    self.head = @queue[0]
    self.tail = @queue.last
  end

  def dequeue
    @queue.delete(@queue.last)
    self.head = @queue[0]
    self.tail = @queue.last
  end

  def empty?
    self.head == nil ? (return true) : (return false)
  end
end
