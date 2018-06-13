require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    temp_node = root
    if temp_node.rating > node.rating && temp_node.left
      insert(temp_node.left, node)
    elsif temp_node.rating > node.rating
      temp_node.left = node
      node.parent = temp_node
    elsif temp_node.rating <= node.rating && temp_node.right
      insert(temp_node.right, node)
    else
      temp_node.right = node
      node.parent = temp_node
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data.nil? || root.nil?
      return nil
    end
    stack = [root]
    visited = []

    while !stack.empty?
      current = stack.last
      visited << current

      if current.title == data
        return current
      elsif !current.left.nil? && !visited.include?(current.left)
        if current.left.title == data
          return current.left
        else
          visited << current.left
          stack << current.left
        end
      elsif !current.right.nil? && !visited.include?(current.right)
        if current.right.title == data
          return current.right
        else
          visited << current.right
          stack << current.right
        end
      else
        stack.pop
      end

    end

    return nil
  end

  def delete(root, data)
    target = find(root, data)
    return nil if data == nil || target == nil

    if target.left && target.right
      successor = find_min(target.right)
      target.title = successor.title
      target.rating = successor.rating
      if target.parent.nil?

      elsif target.parent.left == target
        target.parent.left = successor
      elsif target.parent.right == target
        target.parent.right = successor
      end
      delete(successor, successor.title)
    elsif target.left
      if target.parent.nil?

      elsif target.parent.left == target
        target.parent.left = target.left
      elsif target.parent.right == target
        target.parent.right = target.left
      end
      target.rating = target.left.rating
      target.title = target.left.title
      target.right = target.left.right
      target.left = target.left.left

    elsif target.right
      if target.parent.nil?

      elsif target.parent.left == target
        target.parent.left = target.right
      elsif target.parent.right == target
        target.parent.right = target.right
      end
      target.rating = target.right.rating
      target.title = target.right.title
      target.left = target.right.left
      target.right = target.right.right

    else
      target.title = nil
      target.rating = nil
      if target.parent.nil?

      elsif target.parent.left == target
        target.parent.left = nil
      elsif target.parent.right == target
        target.parent.right = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    return nil if @root.nil?

    queue = Queue.new
    queue.enq(@root)

    while queue.size != 0
      node = queue.deq
      puts "#{node.title}: #{node.rating}"
      queue.enq(node.left) if node.left
      queue.enq(node.right) if node.right
    end
  end

  private

  def find_min(root)
    current_node = root
    while current_node.left
      current_node = current_node.left
    end
    current_node
  end
end
