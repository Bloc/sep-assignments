require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    self.root = root
    root.left = nil
    root.right = nil
    root.parent = nil
  end

  def insert(root, node)
    if root == nil
      self.root = node
      return
    end
    
    node1 = find(root, node.title)
    if node1
      parent = node1.parent
      delete_aux(root, node1)
      if parent == nil
        parent = self.root
      end
      insert(parent, node)
      return
    end
    
    if node.rating < root.rating
      if root.left
        insert(root.left, node)
      else
        root.set_left(node)
      end
    else
      if root.right
        insert(root.right, node)
      else
        root.set_right(node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root == nil
      return nil
    end
    if root.title == data
      return root
    end
    return find(root.left, data) || find(root.right, data)
  end
  
  def leftmost(root)
    if root == nil
      return nil
    end
    if root.left == nil
      return root
    end
    return leftmost(root.left)
  end
  
  def rightmost(root)
    if root == nil
      return nil
    end
    if root.right == nil
      return root
    end
    return rightmost(root.right)
  end
  
  def replace_node(root, node)
    node && node.detach
    if node && node != root.left
      node.set_left(root.left) # the new node replaces the parent, so it has the same value of left
    end
    if node && node != root.right
      node.set_right(root.right)
    end
    if root.parent && root.parent.left == root
      root.parent.set_left(node)
    end
    if root.parent && root.parent.right == root
      root.parent.set_right(node)
    end
    if root == self.root
      self.root = node
    end
  end
  
  def delete(root, data)
    node = find(root, data)
    return delete_aux(root, node)
  end

  def delete_aux(root, node)
    if node == nil
      return nil
    end
    # We want the replacement node for the deleted node to be
    # something to the left of everything on the right, and to
    # the right of everything on the left. If the deleted node
    # has no children, then the replacement is nil
    if !node.left && !node.right # if no children, can just remove from parent's children
      newnode = nil
    elsif node.right # then we can let the replacement be the leftmost node on the right
      newnode = leftmost(node.right)
    else # node.right == nil && node.left != nil  Then the new node is the rightmost node on the left
      newnode = rightmost(node.left)
    end
    replace_node(node, newnode)
    return node
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children == nil
     puts("#{self.root.title}: #{self.root.rating}")
     children = [self.root.left, self.root.right]
     printf(children)
    elsif children.length == 0
      return
    else
      grandkids = []
      children.each do |node|
        if node
          puts("#{node.title}: #{node.rating}")
          grandkids.push(node.left)
          grandkids.push(node.right)
        end
      end
      printf(grandkids)
    end
  end
end
