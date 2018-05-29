class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def dequeue
    if @queue.empty?
      nil
    else
      first = @queue[0]
      @queue.delete_at(0)
      first
    end
  end

  def empty?
    if @queue.length > 0
      false
    else
      true
    end
  end
end