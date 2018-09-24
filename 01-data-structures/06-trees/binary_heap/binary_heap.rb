require_relative 'node'

class BinaryHeap

  attr_accessor :temp

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      temp = root.dup
      root.rating = node.rating
      root.title = node.title
      insert(root, temp)
    else
      if root.right == nil
        root.right = node
      elsif (root.left == nil) && (root.right != nil)
        root.left = node
      elsif (root.left != nil) && (root.right != nil) && (root.right.right != nil) && (root.right.left != nil)
        insert(root.left, node)
      elsif (root.left != nil) && (root.right != nil)
        insert(root.right, node)
      end
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    elsif root.title == data
      root.title = root.right.title
      root.rating = root.right.rating
      temp_node = root.right.dup
      root.right = nil
      if temp_node.left != nil
        reorder(temp_node.left)
      end
      if temp_node.right != nil
        reorder(temp_node.right)
      end
    else
      node = find(root, data)
      parent = find_parent(root, node)
      if parent.left == node
        parent.left = nil
      elsif parent.right == node
        parent.right = nil
      end
      if node && node.left
        reorder(node.left)
      end
      if node && node.right
        reorder(node.right)
      end
    end
  end

  def find(root, data)
    if root.nil? || data.nil?
      return nil
    elsif root.title == data
      return root
    else
      node = find(root.right, data)
      if node.nil?
        node = find(root.left, data)
      end
      return node
    end
  end

  def printf(children=nil)
    queue = [@root]
    list = [@root]

    while queue.length > 0 do
      item = queue.shift
      if item.left != nil
        queue.push(item.left)
        list.push(item.left)
      end
      if item.right != nil
        queue.push(item.right)
        list.push(item.right)
      end
    end

    list.each_with_index do |item, index|
      if index == 0
        level = 0
      else
        level = (Math.log2(index + 1)).floor
      end
      if item != nil
        title = item.title
        rating = item.rating
        puts "Tree Level #{level} - #{title}: #{rating}"
      end
    end
  end

  private

  def find_parent(root, node)
    if root == nil
      return nil
    else
      if root.left != nil
        if root.left.title == node.title
          return root
        else
          left_parent = find_parent(root.left, node)
          return left_parent unless left_parent.nil?
        end
      end
      if root.right != nil
        if root.right.title == node.title
          return root
        else
          right_parent = find_parent(root.right, node)
          return right_parent unless right_parent.nil?
        end
      end
    end
  end

  def reorder(target)
    insert(@root, target)
    if target.left != nil
      insert(@root, target.left)
    end
    if target.right != nil
      insert(@root, target.right)
    end
    target = nil
  end
end
