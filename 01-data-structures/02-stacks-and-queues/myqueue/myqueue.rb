class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    if @queue.empty?
      @queue[0] = element
    else
      new_array = [element]
      @queue.each_with_index do |person, index|
        new_array[index + 1] = @queue[index]
      end
      @queue = new_array
    end
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    if @queue.empty?
      return true
    else
      second_array = []
      @queue.each_with_index do |person, index|
        @queue[index - 1]
      end
      @queue = second_array
    end
    @tail = @queue[-1]
    @head = @queue[0]
  end

  def empty?
    if @queue.length == 0
      return true
    else
      return false
    end
  end
end
