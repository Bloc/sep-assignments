class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :queue

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    self.tail = element
    self.head = element if queue.length === 0
    queue[queue.length] = element
  end

  def dequeue
    queue.slice!(0,1)
    self.head = queue[0]
  end

  def empty?
    return true unless self.head
    false
  end
end
