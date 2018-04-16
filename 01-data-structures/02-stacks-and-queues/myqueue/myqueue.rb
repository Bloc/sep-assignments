class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

#  do not use existing push command,keep pointers for head/tail
  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue[-1]
  end

# do not use existing pop command, keep pointers for head/tail
  def dequeue
    @tail = @queue.slice(-1)
    @queue = @queue.slice!(0..-2)
    @head = @queue[0]
    @tail
  end

 # avoid using empty?
  def empty?
    if @queue.length == 0
      return true
    else
      return false
    end
  end
end
