class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    self.data = data
    self.next = nil
  end
end

#N1
#Data = N1
#next = N2

#N2
#Data = N2
#next = N3

#N3
#Data = N3
#next = nil
