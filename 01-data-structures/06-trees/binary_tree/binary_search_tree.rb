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

  # Recursive Depth First Search, data(string)
  def find(root, data)
    return nil if data.nil?       #handle nil data search

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
    return nil if data.nil?               #handle nil data
    node_to_delete = self.find(root, data)

    if node_to_delete.left.nil? && node_to_delete.right.nil?
      # Case 1 - No children
      # Find parent.left or parent.right that equals data and set it = nil
      parent = self.find_parent(root, data)
      parent.left = nil if parent.left && parent.left.title == data
      parent.right = nil if parent.right && parent.right.title == data
    elsif (node_to_delete.left || node_to_delete.right) && !(node_to_delete.left && node_to_delete.right)
      #Case 2 - One child
      #link child of node_to_delete to the parent of node_to_delete
      parent = self.find_parent(root, data)
      child = node_to_delete.left || node_to_delete.right
      parent.left.title == data ? parent.left = child : parent.right = child
    else
      #Case 3 - Two children
      #find min in right sub tree, copy that inplace of node_to_delete, delete the copy
      min = find_min(node_to_delete.right)
      min.left = node_to_delete.left
      parent = find_parent(@root, node_to_delete.title)

      if parent.left && parent.left.title == node_to_delete.title
        parent.left = min
      else
        parent.right = min
      end

      puts "New tree:"
      self.printf
    end

    # #recursive solution
    # node_to_delete = self.find(root, data)
    #
    # if root.nil?
    #   return root
    # elsif node_to_delete.rating < root.rating
    #   root.left = self.delete(root.left, data)
    # elsif node_to_delete.rating > root.rating
    #   root.right = self.delete(root.right, data)
    # else
    #   if root.left.nil? && root.right.nil?  #Case 1: no child
    #     root = nil
    #   elsif root.left.nil?                  #Case 2: 1 child - right
    #     root = root.right
    #   elsif root.right.nil?                 #Case 2: 1 child - left
    #     root = root.left
    #   else                                  #Case 3: 2 children
    #     min = self.find_min(root.right)     # find min root.right
    #     root = min
    #     root.right = self.delete(root.right, min.title)
    #   end
    #   return root
    # end
  end

  # Finds the node with minimum value
  def find_min(root)
    if root.left.nil?
      return root
    else
      return find_min(root.left)
    end
  end

  # Recursive Breadth First Search
  def printf
    return if @root.nil?
    queue = [@root]

    while !queue.empty?
      current = queue.shift
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
      print "#{current.title}: #{current.rating}\n"
    end
  end

end
