class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
    @tailcounter = -1
  end

  def enqueue(element)
    @tailcounter += 1
    @queue[@tailcounter] = element
    @head = @queue[0]
    @tail = @queue[@tailcounter]
  end

  def dequeue
    #set temp to head
    temp = @head

    #left shift the list by one entry
    (0...@queue.length-1).each do |i|
      @queue[i] = @queue[i+1]
    end

    @queue[@tailcounter] = nil
    @head = @queue[0]
    @tailcounter -= 1

    #keeping track of head and tail
    if @tailcounter < 0
      @head = nil
      @tail = nil
    else
      @tail = @queue[@tailcounter]
    end

    return temp
  end

  def empty?
    if @head == nil
      true
    else
      false
    end
  end
end