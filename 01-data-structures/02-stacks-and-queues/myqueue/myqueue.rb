class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    index = @queue.length

    @queue << element
  end

  def dequeue
    @queue.delete_at(0)

    @head = @queue[0]
    puts @queue
  end

  def empty?
    if @queue.length < 1
      true
    else
      false
    end
  end
end
