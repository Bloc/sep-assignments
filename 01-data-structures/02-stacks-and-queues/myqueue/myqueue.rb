class MyQueue
  attr_accessor :head, :tail

  def initialize
    @queue = []
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue.unshift(element)
    assignHeadTail
  end

  def dequeue
    @queue.delete_at(-1)
    assignHeadTail
  end

  def empty?
    !@queue[0] ? true : false
  end

  private

  def assignHeadTail
    @head = @queue[0]
    @tail = @queue[-1]
  end
end