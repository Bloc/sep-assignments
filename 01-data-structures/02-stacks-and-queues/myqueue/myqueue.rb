class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    new_array = []
    new_array[0] = element

    @queue.each do |element|
      new_array << element
    end

    @queue = new_array

    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    new_array = []
    i = 0
    while i < @queue.length - 2
      new_array << @queue[i]
      i += i
    end

    @queue = new_array

    @head = @queue[0]
    @tail = @queue[-1]
  end

  def empty?
    if @queue.length == 0
      true
    else
      false
    end
  end
end
