class Node
  attr_accessor :next
  attr_accessor :data
  attr_accessor :before 

  def initialize(data)
    @data = data 
  end
end