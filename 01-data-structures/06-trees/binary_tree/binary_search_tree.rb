require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    # identify if the new data has a higher age than existing root entry
    if node.rating > root.rating
      # when new actor age is higher than root, insert it to right of root
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    else
      # when new actor age is lower than root, insert it to the left of the root
      if root.left.nil?
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    node = root
    if !root.nil? # gracefully handle nil
      if root.title != data # checks to see if new entry doesn't already exist
        node = find(root.left, data)
        if node.nil?
          node = find(root.right, data)
        end
      end
    end
    return node
  end

  def delete(root, data)
    if @root == root && @root.title == data
      right = @root.right
      @root = @root.left
      insert(@root, right)
    else
      node = find(root, data)
      if !node.nil?
        parent = find_parent(root, node)
        if parent.rating > node.rating
          parent.left = node.left
          insert(parent.left, node.right) unless node.right.nil?
        else
          parent.right = node.left
          insert(parent.right, node.right) unless node.right.nil?
        end
      end
    end
  end

  def find_parent(root, node)
    parent = root
    if node.rating > parent.rating
      if parent.right.title != node.title
        parent = find_parent(parent.right, node)
      end
    else
      if parent.left.title != node.title
        parent = find_parent(parent.left, node)
      end
    end
    return parent
  end

  # Recursive Breadth First Search
  def printf
    for i in 1..tree_height(@root) do
      print_given_level(@root, i)
    end
  end

  def tree_height(root)
    if root.nil?
      return 0
    else
      lheight = tree_height(root.left)
      rheight = tree_height(root.right)
      if lheight > rheight
        return lheight + 1
      else
        return rheight + 1
      end
    end
  end

  def print_given_level(node, level)
    if node.nil?
      return
    elsif level == 1
      puts "#{node.title}: #{node.rating}"
    else
      print_given_level(node.left, level-1)
      print_given_level(node.right, level-1)
    end
  end
end
