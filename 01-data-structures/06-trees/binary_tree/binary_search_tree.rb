require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating > root.rating
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    else
      if root.left.nil?
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.rating == data
      return root
    else
      if !root.right.nil? && data > root.rating
        self.find(root.right, data)
      elsif !root.left.nil?
        self.find(root.left, data)
      end
    end
  end

  def find_parent(root, data)
    if root.rating == data
      return nil
    elsif (!root.left.nil?  && root.left.rating  == data) ||
          (!root.right.nil? && root.right.rating == data)
      return root
    elsif data > root.rating
      self.find_parent(root.right, data)
    else
      self.find_parent(root.left, data)
    end
  end

  def delete(root, data)
    parent = find_parent(root, data)

    if !parent.nil?
      if parent.rating > data
        target_node = parent.left
      else
        target_node = parent.right
      end
    elsif root.rating == data
      target_node = root # if parent is nil target is root
    else
      return
    end

    target_big_guy = target_node.left
    until target_big_guy.right.nil?
      target_big_guy = target_big_guy.right
    end

    unless parent.nil?
      if parent.rating > data
        parent.right = target_big_guy
      else
        parent.left = target_big_guy
      end
    end

    big_parent = find_parent(root, target_big_guy.rating)
    big_parent.right = target_big_guy.left

    target_big_guy.left = target_node.left
    target_big_guy.right = target_node.right

    target_node.left = nil
    target_node.right = nil

    if target_node == @root
      @root = target_big_guy
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children.nil?
      puts @root.title + ": " + @root.rating.to_s
      children = [@root.left, @root.right]
      printf(children)
    else
      new_kids = []
      children.each do |kids|
        puts kids.title + ": " + kids.rating.to_s
        unless kids.left.nil?
          new_kids << kids.left
        end
        unless kids.right.nil?
          new_kids << kids.right
        end
      end
      unless new_kids.empty?
        printf(new_kids)
      end 
    end
  end
end
