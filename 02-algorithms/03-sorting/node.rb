class Node
  attr_accessor :value
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end
end