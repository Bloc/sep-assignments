class MyQueue
  attr_reader :head, :tail

  def initialize
    @queue = Array.new

    @head = @queue[0]
    @head_pointer = 0

    @tail = @queue[0]
    @tail_pointer = 0
  end

  def enqueue(element)
    @queue << element
    @tail_pointer += 1
    @tail = @queue[@tail_pointer]
  end

  def dequeue
    @tail -= 1
    @queue.delete_at(0)
  end

  def empty?
  end
end
