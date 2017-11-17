require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    @root.left = nil
    @root.right = nil
  end

  def insert(root, node)
    if node.rating < root.rating #go left
      if root.left.nil?
        root.left = node
      else # insert again - new root is root.left
        insert(root.left, node)
      end
    elsif node.rating > root.rating
      if root.right.nil?
        root.right = node
      else # insert again - new root is root.right
        insert(root.right, node)
      end
    end
  end

  def find(root, data)
    if data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right !=nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    return nil if data.nil?
    #find the node
    node = find(root,data)
    #does it have any child nodes?
    if node.nil?
      return nil
    else
      node.title = nil
      node.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    
    tree_output = [@root]
    tree_output.each do |node|
      tree_output.push(node.left) if !node.left.nil?
      tree_output.push(node.right) if !node.right.nil?
    end

    tree_output.each do |node|
      puts "#{node.title}: #{node.rating}"
    end

  end
end
