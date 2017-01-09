require_relative 'node'
require 'thread'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if @root.nil?
      @root = node
    else
      current = @root
      while(true) #while any of the below are true statements, keep performing while loop
        if node.rating >= current.rating
          if current.right == nil
            current.right = node
            node.parent = current
            break
          else
            current = current.right #moving down the right side until nil
          end
        else
          if current.left == nil
            current.left = node
            node.parent = current
            break
          else
          current = current.left  #moving down the left side until nil
          end
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.title == data
      return root
    else
      left = find(root.left, data) if root.left
      right = find(root.right, data) if root.right
      left || right
    end
  end



  def delete(root, data)
    return nil if data.nil?

    node = find(root, data)

    if node.left.nil? && node.right.nil?
      if node.parent.right == node
        node.parent.right = nil
      elsif node.parent.left == node
        node.parent.left = nil
      end
    elsif !node.left.nil? && node.right.nil?
      if node.parent.left == node
        node.parent.left = node.left
        node.parent.left.parent = node.parent
      elsif node.parent.right == node
        node.parent.right = node.left
        node.parent.right.parent = node.parent
      end
    elsif node.left.nil? && !node.right.nil? # if node left is empty, but right is not empty...
      #if the nodes parent.left or right is the found node, make the parents.left or right the node.right.  Change the node.right to node.parents
      if node.parent.left == node
        node.parent.left = node.right
        node.parent.left.parent = node.parent
      elsif node.parent.right == node
        node.parent.right = node.right
        node.parent.right.parent = node.parent
      end
    end
  end

  # Recursive Breadth First Search
  #not sure what children=nil was hinting about...but, I'm passing specs.
  def printf(children=nil)
    return nil if @root.nil?
    queue = Queue.new
    queue.enq(@root)
    result = nil
    while !queue.empty?
      value = queue.deq
      print "#{value.title}: #{value.rating}\n" if !value.title.nil?
      # keep moving the levels in tree by pushing left and right nodes of tree in queue
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end
end
