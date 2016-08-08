class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    set_head_tail
  end

  def dequeue
    if !@queue.empty?
      @queue.shift
      set_head_tail
  end

  def empty?
    @queue.count == 0 ? true : false
  end

  private 

  def set_head_tail
    @tail = @queue[0]
    @head = @queue[-1]
  end
end