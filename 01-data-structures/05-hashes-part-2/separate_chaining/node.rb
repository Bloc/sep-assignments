class Node
  attr_accessor :next, :key, :value

  def initialize(key, value)
    self.key = key
    self.value = value
    self.next = nil
  end
end
