class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :queue

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    if self.empty?
      @queue[0], @head, @tail = element, element, element
    else
      @queue[@queue.length], @tail = element, element
    end
  end

  def dequeue
    @queue.delete_at(0)
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def empty?
    if self.queue.length > 0
      false
    else
      true
    end
  end
end
