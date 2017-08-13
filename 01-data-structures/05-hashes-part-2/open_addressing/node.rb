class Node
  attr_accessor :next
  attr_accessor :key
  attr_accessor :value
  
  attr_accessor :label
  
  @@node_number = 0

  def initialize(key, value)
    @key = key
    @value = value
    @label = @@node_number
    @@node_number += 1
  end
end