class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def enqueue(element)
    @queue.length.times do |x|
      @queue[@queue.length - x] =  @queue[@queue.length - x -1]
    end
    @queue[0] = element
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def dequeue
    temp = @queue[0]
    @queue.each_with_index do |val, index|
      @queue[index] = @queue[index + 1]
    end
    return temp
  end

  def empty?
    if @queue[0] == nil
      true
    else
      false
    end
  end
end
