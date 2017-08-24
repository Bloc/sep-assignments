class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @items = 0
  end

  def enqueue(element)
    if @items == 0
      @head = element
    end
    @queue[@items] = element
    @tail = element
    @items += 1
  end

  def dequeue
    tmp = @head
    (0..@queue.length-1).each do |i|
      @queue[i] = @queue[i+1] 
    end
    @items -= 1
    @head = @queue[0]
    @tail = @queue[@items-1]
    return tmp
  end

  def empty?
    @items == 0
  end
end