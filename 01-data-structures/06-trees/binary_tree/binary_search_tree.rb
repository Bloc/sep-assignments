require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating <= root.rating
      root.left ? self.insert(root.left, node) : root.left = node
    else
      root.right ? self.insert(root.right, node) : root.right = node
    end
  end

  # Recursive Depth First Search
  # data = title(string)
  def find(root, data)
    # puts "Root title: #{root.title}"
    # puts root.left ? "Left title: #{root.left.title}" : "No left node"
    # puts root.right ? "Right title: #{root.right.title}" : "No right node"

    #handle nil data search
    return nil if data.nil?

    if root
      if root.title == data
        return root
      else
        return self.find(root.left, data) || self.find(root.right, data)
      end
    end
  end

  def find_parent(root, data)
    return nil if data.nil?
    if root
      if (root.left && root.left.title == data) || (root.right && root.right.title == data)
        return root
      else
        return self.find_parent(root.left, data) || self.find_parent(root.right, data)
      end
    end
  end

  def delete(root, data)
    #handle nil data
    return nil if data.nil?

    node_to_delete = self.find(root, data)
    # puts "Data: #{data}"
    # puts node_to_delete ? "node to delete: #{node_to_delete}, #{node_to_delete.title}" : "No node found"

    #For leafs: find parent.left or parent.right that equals data and set it  = nil
    if node_to_delete.left.nil? && node_to_delete.right.nil?
      parent = self.find_parent(root, data)
      parent.left = nil if parent.left && parent.left.title == data
      parent.right = nil if parent.right && parent.right.title == data
    end

    # For parents with one child: link child of node_to_delete to the parent of node_to_delete
    if (node_to_delete.left || node_to_delete.right) && !(node_to_delete.left && node_to_delete.right)
      parent = self.find_parent(root, data)
      puts  "parent: #{parent.title}"
      child = node_to_delete.left || node_to_delete.right
      puts  "child: #{child.title}"
      parent.left.title == data ? parent.left = child : parent.right = child
    end

    # For parents with two childen
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    # prints a depth first search
    # if root
    #   #return node when you find title matching data
    #   puts root ? "root title: #{root.title}" : "No root node"
    #
    #   #recursively search left sub-tree
    #   self.find(root.left, data) if root.left
    #
    #   #recursively search right sub-tree
    #   self.find(root.right, data) if root.right
    # end

  end

end
