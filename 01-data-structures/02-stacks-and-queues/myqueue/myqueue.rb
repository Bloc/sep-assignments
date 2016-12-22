class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    if empty?
      @tail = element
    end
    @head = element
    @queue.insert(0, element)
  end

  def dequeue
    result = tail
    @queue.delete_at(-1)
    @tail = @queue[-1]
    if empty?
      @head = nil
    end
  end

  def empty?
    @queue.empty?
  end
end
