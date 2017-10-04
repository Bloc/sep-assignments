class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = element if empty?
    @tail = element
  end

  def dequeue
    temp = @head
    last = @queue.length - 1
    (0..last).each { |i| @queue[i] = @queue[i + 1] }
    @head = @queue[0]
    @tail = @queue[last - 1]
    temp
  end

  def empty?
    @head == nil || @queue.length < 1
  end
end
