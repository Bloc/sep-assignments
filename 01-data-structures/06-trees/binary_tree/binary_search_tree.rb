require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    currNode = root
    if node.rating > currNode.rating
      if currNode.right == nil
        currNode.right = node
        currNode.right.parent = currNode
      else
        insert(currNode.right, node)
      end
    elsif node.rating < currNode.rating
      if currNode.left == nil
        currNode.left = node
        currNode.left.parent = currNode
      else
        insert(currNode.left, node)
      end
    else
      return "Sorry, no duplicate ratings. Please try again."
    end
  end

  # Recursive Depth First Search
  def find(node, target)
    if node.nil?
      return nil
    elsif node.title == target
      return node
    else
      x = find(node.right, target)
      if x != nil
        return x
      else
        return find(node.left, target)
      end
    end
  end

  def delete(root, data)
    found = find(root, data)
    return nil if found == nil

    unless found.left.nil? && found.right.nil?
      if found.left.nil?
        if found.parent.left == found
          found.parent.left = found.right
        else
          found.parent.right = found.right
        end

        found.right.parent = found.parent
      elsif found.right.nil?
        if found.parent.left == found
          found.parent.left = found.left
        else
          found.parent.right = found.left
        end

        found.left.parent = found.parent
      else
        desired_node = found.left

        until desired_node.right.nil?
          desired_node = desired_node.right
        end

        desired_node.parent.left = desired_node.left

        desired_node.left = found.left
        desired_node.right = found.right
        desired_node.parent = found.parent
        found.left.parent = desired_node if !found.left.nil?
        found.right.parent = desired_node if !found.right.nil?

        if found.parent.left == found
          found.parent.left = desired_node
        else
          found.parent.right = desired_node
        end
      end
    end
    if found.parent.left == found
      found.parent.left = nil
    else
      found.parent.right = nil
    end
    found = nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children == nil
      children = [@root]
    end
    nextRow = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      nextRow.push(child.left) if child.left != nil
      nextRow.push(child.right) if child.right != nil
    end
    if nextRow.size == 0
      return nil
    else
      printf(nextRow)
    end
  end
end
