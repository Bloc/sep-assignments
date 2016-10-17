require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)

    if node.rating > root.rating
      if root.left.nil?
        root.left = node
      else
        insert(root.left, node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, rating)
    if rating == nil
      return nil
    end

    if root == nil
      return nil
    end
    if rating == root.rating
      root
    else
      # puts root.rating
      # puts rating
      if rating < root.rating
        find(root.left, rating)
      elsif rating > root.rating
        find(root.right, rating)
      end
    end
  end

  def delete(root, rating)
    if rating == nil
      return nil
    end

    if root == nil
      return root
    elsif rating < root.rating
      root.left = delete(root.left, rating)
    elsif rating > root.rating
      root.right = delete(root.right, rating)
    else
      if root.left == nil && root.right == nil
        return nil
      elsif root.right == nil
        return root.left
      elsif root.left == nil
        return root.right
      end
    end
  end

  # Recursive Breadth First Search
  def printf
    queue = [@root]
    returned_string = ""

    until queue.empty?
      temp_root = queue.shift

      unless temp_root.left == nil
        queue << temp_root.left
      end
      unless temp_root.right == nil
        queue << temp_root.right
      end

      returned_string << "#{temp_root.title}: #{temp_root.rating}\n"
    end

    puts returned_string
  end
end
