class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue = [element] + @queue;
    @head = @queue[0];
    self.tail = @queue.last;
  end

  def dequeue
    @queue.delete(@queue[0]);
    @head = @queue[0];
  end

  def empty?
    if @queue.length < 1
      true;
    else
      false;
    end
  end
end
