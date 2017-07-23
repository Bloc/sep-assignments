class MyQueue
  attr_accessor :head
  attr_accessor :tail, :queue

  #FIFO Stack

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element) # adds an item to the end the queue
    index = queue.length
    queue[index] = element
    @head = queue.first
    @tail = queue.last 
    print(queue)
  end

  def dequeue
    if !empty?
      #removes an item from the front of the queue
      queue.delete_at(0)
      #updates the head and tail accessors properly
      @head = queue.first
      @tail = queue.last
    end
    return @head
  end

  def empty?
    #returns true if the queue is emtpy
    #returns false if the queue is not empty
    @queue.length == 0 
  end
end

#Array [0,1,2,3,4,5,6,7,8]
#       |-Head           