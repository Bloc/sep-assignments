class MyQueue
  attr_reader :head, :tail

  def initialize
    @queue = Array.new
    @head = nil
    @tail = nil
  end

  def enqueue(element)
    @queue << element
    if !@head
      @head = element
      @tail = element
    else
      @tail = element
    end
  end

  def dequeue
    if @head
      @head = @queue[1]
      return @queue.delete_at(0)
    else
      return nil
    end
  end

  def empty?
    !@head
  end
end
