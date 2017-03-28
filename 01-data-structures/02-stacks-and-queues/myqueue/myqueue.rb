class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue.last
    @tail = @queue.first
  end

  def enqueue(element)
    @queue.insert(0, element)
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    if !empty?
      @queue.delete_at(@queue.length-1) 
    end
    @head = @queue.last
    @tail = @queue.first
  end

  def empty?
    @queue.empty?
  end
end