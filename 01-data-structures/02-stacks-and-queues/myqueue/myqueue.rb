class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
    @index = [nil,0]

  end

  def enqueue(element)
    @queue[@index[1]] = element
    @head = element
    if @index[0] == nil
      @index[0] = 0
      @tail = @queue[0]
    end
    @index[1] += 1
  end

  def dequeue
    item = @tail
    @queue.shift
    @tail = @queue[0]
    @index[1] -= 1
    if empty?
      @head = nil
      @tail = nil
    end
    return item
  end

  def empty?
    return @index[1] == 0
  end
end
