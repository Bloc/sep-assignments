require_relative 'node'

class Heap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root != nil
      if root.rating > node.rating
        if root.left == nil
          root.left = node
        else
          self.insert(root.left, node)
        end
      elsif root.rating < node.rating
        if root.right == nil
          root.right = node
        else
          self.insert(root.right, node)
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, rating)
    if rating != nil && root != nil
      if root.rating == rating
        return root
      elsif root.rating > rating
        if root.left != nil
          self.find(root.left, rating)
        end
      elsif root.rating < rating
        if root.right != nil
          self.find(root.right, rating)
        end
      end
    end
  end

  def delete(root, rating)
    if root == nil
      return nil
    elsif rating < root.rating
      root.left = self.delete(root.left, rating)
    elsif rating > root.rating
      root.right = self.delete(root.right, rating)
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
    array = [@root]
    string = ""
    until array.empty?
      new_root = array.shift

      unless new_root.left == nil
        array << new_root.left
      end
      unless new_root.right == nil
        array << new_root.right
      end
      string << "#{new_root.title}: #{new_root.rating}\n"
    end
    puts string
  end
end
