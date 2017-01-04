require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node < root
      if root.left
        insert(root.left, node)
      else
        root.left = node
      end
    else
      if root.right
        insert(root.right, node)
      else
        root.right = node
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root
      if root.title == data
        root
      else
        find(root.left, data) || find(root.right, data)
      end
    end
  end

  # Does not check to see if root is nil.
  def delete(root, data)
    if root == @root && root.title == data
      # Delete the root node.
      if !root.left
        @root = root.right
        # Go left and find the right-most node from there.
      elsif !root.left.right
        root.left.right = root.right
        @root = root.left
      else
        leaf_parent = root.left
        while leaf_parent.right.right
          leaf_parent = leaf_parent.right
        end
        leaf = leaf_parent.right
        leaf_parent.right = leaf.left
        leaf.left = root.left
        leaf.right = root.right
        @root = leaf
      end
      # See if root is the parent of the target node.
    elsif root.left
      if root.left.title != data
        delete(root.left, data)
        # Delete root.left.
      elsif !root.left.left
        root.left = root.left.right
        # Go left and find the right-most node from there.
      elsif !root.left.left.right
        root.left.left.right = root.left.right
        root.left = root.left.left
      else
        leaf_parent = root.left.left
        while leaf_parent.right.right
          leaf_parent = leaf_parent.right
        end
        leaf = leaf_parent.right
        leaf_parent.right = leaf.left
        leaf.left = root.left.left
        leaf.right = root.left.right
        root.left = leaf
      end
    elsif root.right
      if root.right.title != data
        delete(root.right, data)
        # Delete root.right.
      elsif !root.right.left
        root.right = root.right.right
        # Go left and find the right-most node from there.
      elsif !root.right.left.right
        root.right.left.right = root.right.right
        root.right = root.right.left
      else
        leaf_parent = root.right.left
        while leaf_parent.right.right
          leaf_parent = leaf_parent.right
        end
        leaf = leaf_parent.right
        leaf_parent.right = leaf.left
        leaf.left = root.right.left
        leaf.right = root.right.right
        root.right = leaf
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=[@root])
    if !children.empty?
      node = children.delete_at(0)
      puts(node)
      if node.left
        children.push(node.left)
      end
      if node.right
        children.push(node.right)
      end
      printf(children)
    end
  end
end
