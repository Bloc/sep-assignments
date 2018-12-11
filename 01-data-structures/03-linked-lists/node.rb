class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
     self.data = data
     self.next = nil
  end
end

#Each element on the linked list is represented by a node that contains 
#two attributes:

  #1. The value that the element holds.
  #2. A pointer to the next node in the list.

  #[ value | next ] -> [ value | next ] -> [ value | next ] -> X (nil)

#To get an element from a singly linked list you have to traverse it from
#head to tail. That’s the only direction possible because nodes on singly
#linked lists don’t have back pointers.