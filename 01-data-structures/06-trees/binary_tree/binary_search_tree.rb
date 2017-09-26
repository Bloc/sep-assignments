require_relative 'node'

class BinarySearchTree

  def initialize(root)
    #the first node
    @root = root
  end

  def insert(root, node)
    #check if the new inserted node has a higher age than the existing root entry
    if node.rating > root.rating
      #node age is higher than root age - therefore insert it to the right
      if root.right == nil
        root.right = node
      else
        insert(root.right, node)
      end
    else
      #node age is lower than root age - insert it to the left of the root
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end


  # Recursive Depth First Search
  def find(root, data)
    node = root
    if root != nil 
      if root.title != data #recurisve statement searches down left and right until object is found
        node = find(root.right, data)
        if node.nil?
          node = find(root.right, data)
        end
      end
    end
    return node
  end

  def delete(root, data)
    
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
