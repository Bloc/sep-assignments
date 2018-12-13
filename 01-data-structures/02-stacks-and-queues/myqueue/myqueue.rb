class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :queue

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    if empty?
      self.queue[0] = element
      self.head = element
      self.tail = element
    else
      self.queue[queue.size] = element
      self.tail = element
    end

  end

  def dequeue
    self.queue.delete_at(0)
    self.head = self.queue[0]
    self.tail = self.queue[-1]

  end

  def empty?
    queue.size == 0
  end


end