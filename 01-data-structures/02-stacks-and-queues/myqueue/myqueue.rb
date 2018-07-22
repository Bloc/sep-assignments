class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = nil
    @tail = nil
  end

  def enqueue(element)
    @queue.insert(@queue.length,element)
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    temp = @queue.first
    @queue.shift()
    @tail = @queue.last
    @head = @queue.first
    return temp
  end

  def empty?
    @queue.empty?
  end
end
