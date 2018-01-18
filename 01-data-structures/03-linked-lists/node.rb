class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    @data, @next = data, nil
  end
end
