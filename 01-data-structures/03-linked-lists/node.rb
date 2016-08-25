class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    #initialize node with its own data point and a pointer to next node
    self.data = data
    self.next = nil
  end

end
