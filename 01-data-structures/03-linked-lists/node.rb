class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    self.next = nil
    self.data = data
  end
end