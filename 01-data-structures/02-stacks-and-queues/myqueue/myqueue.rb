class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head  = @queue[0]
    @tail  = @queue[queue.length-1]
  end

  # Insert element at top of queue (0 position), redefine head value (tail value is same)
  def enqueue(element)
    @queue.insert(0,element)
    @head  = @queue[0]
  end

  # Remove element at top of queue (0 position), redefine head value (tail still stays the same)
  def dequeue
    @queue.slice!
    @head  = @queue[0]
  end

  #  If stack is empty, comes back as true
  def empty?
    @queue.length == 0
  end
end