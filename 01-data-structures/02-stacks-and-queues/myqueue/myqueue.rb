class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue << element
    set_pointers(@queue)
  end

  def dequeue
    @queue.delete_at(0)
    set_pointers(@queue)
  end

  def empty?
    @queue.count === 0
  end

private

  def set_pointers(array)
    return unless array.kind_of?(Array)
    @head = array[0]
    @tail = array[-1]
  end

end