require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.nil?
      root = node
    end

    temp = root
    if node.rating <= temp.rating
      if temp.left.nil?
        temp.left = node
      else
        insert(temp.left, node)
      end
    elsif node.rating > temp.rating
      if temp.right.nil?
        temp.right = node
      else
        insert(temp.right, node)
      end
    end
  end

  # Recursive Depth First Search Using Preorder
  def find(root, data)
    if root.nil? || data.nil?
      return nil
    end

    if root.title === data
      return root
    elsif root.left != nil
      find(root.left, data)
    elsif root.right != nil
      find(root.right, data)
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    end

    if root.right
      if root.right.title === data
        temp = root.right
        root.right = temp.right
        temp.title = nil
        temp.rating = nil
        if root.right != nil
          root.right.left = temp.left
        end
      else
        delete(root.right, data)
      end
    elsif root.left
      if root.left.title === data
        temp = root.left
        root.left = temp.left
        temp.title = nil
        temp.rating = nil
        if root.left != nil
          root.left.right = temp.right
        end
      else
        delete(root.left, data)
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]

    queue.each do |current|
      puts "#{current.title}: #{current.rating}"
      if current.left && current.right
        queue << current.left << current.right
      elsif current.left
        queue << current.left
      elsif current.right
        queue << current.right
      end
    end
  end
end