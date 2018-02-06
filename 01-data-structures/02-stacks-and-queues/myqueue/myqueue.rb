class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def enqueue(element)
    index = @queue.length

    @queue << element
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]

  end

  def dequeue
    temp = @queue[0]
    @queue.delete_at(0)
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]

    temp
  end

  def empty?
    if @queue.length > 0
      false
    end
  end
end
