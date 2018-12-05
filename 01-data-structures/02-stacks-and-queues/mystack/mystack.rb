class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    #attempt #1
    # self.top ||=""
    # self.top << item
    #fails 2nd it context

    #attempt #2
    #add the item at the 1st index (self.top)
    #self.top = ""
    #self.top.insert(-1, item)
    #WORKS!

    #attempt #2
    #add the item at the 1st index (self.top)
    self.top = item
    @stack << item

  end

  def pop()
    #attempt #1
    # if (@stack.length === 0)
    #    nil
    # else
    #    @stack.delete(-1)
    # end

    #attempt #2
    #puts self.top.delete(-1).to_s unless self.top.index[-1] === 0
    #puts self.top.index[-1].to_s unless self.top.index[-1] === 0

    #attempt #3
    last_person = @stack.delete_at(-1)
    self.top = @stack[-1]
    return last_person


  end

  def empty?
    #attempt #1
    # [].empty? ? true : false
    #fails 2nd it context

    #attempt #1
    # self.top = []
    # self.top.empty? ? true : false
    #fails 2nd it context

    #attempt #3
    # self.top ||=""
    # self.top.empty? ? true : false
    #WORKS!

    #attempt #4
    @stack.length == 0
    #WORKS!

  end
end