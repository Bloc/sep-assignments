class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    self.head = @queue.last
    self.tail = @queue.first
  end

  def enqueue(element)
    @queue[@queue.length] = element
    self.head = @queue.last
    self.tail = @queue.first
  end

  def dequeue
    @queue.delete_at(0)
    self.head = @queue.last
    self.tail = @queue.first
  end

  def empty?
    if @queue.length == 0
      true
    else
      false
    end
  end
end