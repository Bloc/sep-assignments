class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
    @tailCount = -1
  end

  def enqueue(element)
    @tailCount += 1
    @queue[@tailCount] = element
    @head = @queue[0]
    @tail = @queue[@tailCount]
  end

  def dequeue
    temp = @head
    (0...@queue.length-1).each do |i|
      @queue[i] = @queue[i+1]
    end
    @queue[@tailCount] = nil
    @head = @queue[0]
    @tailCount -= 1
    if @tailCount < 0
      @head = nil
      @tail = nil
    else
      @tail = @queue[@tailCount]
    end

    return temp
  end

  def empty?
    @head == nil ? true : false
  end
end
