class Node
  attr_accessor :next_node
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value, next_node=nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end
