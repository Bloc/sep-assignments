class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = nil
  end

  def enqueue(element)
      @queue.push(element)
      @tail = @queue[0]
      @head = @queue[(@queue.length - 1)]
  end

  def dequeue
      @queue.delete_at(0)
  end

  def empty?
      if @queue.length == 0
          return true
      else
          return false
      end
  end
end
