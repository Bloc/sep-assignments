class Node
  attr_accessor :key
  attr_accessor :value
  attr_accessor :next

  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
  end
end
