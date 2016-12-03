class Node
  attr_accessor :next, :key, :value

  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
  end
end
