class MyQueue
  # head representes the 'back' of the queue
  # tail represents the 'front' of the queue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.push(element)
    # Add element, so they go to the 'back' of the queue (i.e. the head)
    @head = element
    @tail = @queue[0]
  end

  def dequeue
    removed_item = @queue.shift
    # The 'front' has been removed (i.e. the tail). Need to reset tail.
    @tail = @queue[0]
    return removed_item
  end

  def empty?
    @queue.length == 0
  end
end