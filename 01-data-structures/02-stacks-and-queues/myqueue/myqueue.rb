class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = nil
    @tail_pointer = -1
  end

  def enqueue(element)
    @tail_pointer += 1
    @queue[@tail_pointer] = element
    @head = @queue[0]
    @tail = @queue[@tail_pointer]
  end

  def dequeue
    if !@queue.empty?
      item = @head
      @queue.delete_at(0)
      @tail_pointer -= 1
      @head = @queue[0]
      @tail = @queue[@tail_pointer]
      item
    else
      null
    end
  end

  def empty?
    @queue.length <= 0
  end
end
