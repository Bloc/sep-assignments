class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :queue

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)

    #attempt #1
    # new_item = element
    # @queue.insert(-1, element)
    # @head = @queue[0]
    # @tail = @queue[-1]
    #WORKS

    #attempt #2
    # @queue ||=""
    # @queue.push(element)
    # @head = @queue[0]
    # @tail = @queue[-1]
    #WORKS
    #Don't use PUSH in the method > via instructions

    #attempt #3
    #@queue << element
    #@head = @queue[0]
    #@tail = @queue[-1]

#-----------------------------------
    #attempt #4 - Mentor major help in guidance!
      #first check if queue is empty
      #if the array is empty:
        #assign element to head and tail
      #if not empty put the new element at the end of the queue
        #the passed argument becomes both the first 
          #& last item in the array
    if empty?
      self.queue[0] = element
      self.head = element
      self.tail = element
    else
      self.queue[queue.size] = element
      self.tail = element
    end

  end

  def dequeue
    #attempt #1
    #@queue.empty? ? true : @queue.delete_at[0]
    #fails 1st it context at: q.dequeue

    #attempt #2
    #@queue.length === 0 ? true : @queue.delete_at[0]
    #fails 1st it context at: q.dequeue

    #attempt #3
    # if (@queue.length > 0)
    #   return true
    # else
    #   return false
    # end
    #fails 1st it context at: q.dequeue
    # @queue.length === 0 ? true :

    #attempt #4
    # first_person = @queue.delete_at(0)
    # return first_person unless first_person.empty?
    # @head = @queue[0]
    # @tail = @queue[-1]

    #attempt #5 - didn'tfinish thought - Time with mentor!
    #use self over @ bc @ creates a local variable
    #first_person = @queue.delete_at(0)
    #return first_person unless first_person.empty?
    #@head = @queue[0]
    #@tail = @queue[-1]


    #attempt #6
    #remove item from the front
    #reassign the head to index[0]
    #reassign the tail to index[-1]
    self.queue.delete_at(0)
    self.head = self.queue[0]
    self.tail = self.queue[-1]

  end

  def empty?
    queue.size == 0
  end


end