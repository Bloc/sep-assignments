class Node
  attr_accessor :next
  attr_accessor :key
  attr_accessor :value
  
  attr_accessor :label
  @@number_nodes = 0

  def initialize(key, value)
    self.key = key
    self.value = value
    self.label = @@number_nodes
    @@number_nodes += 1
  end
end