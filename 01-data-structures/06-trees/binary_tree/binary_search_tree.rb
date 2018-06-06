require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    temp_node = root
    while temp_node
      if temp_node.rating > node.rating && temp_node.left
        temp_node = temp_node.left
      elsif temp_node.rating > node.rating
        temp_node.left = node
        temp_node = nil
      elsif temp_node.rating <= node.rating && temp_node.right
        temp_node = temp_node.right
      else
        temp_node.right = node
        temp_node = nil
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil || root.nil?
      return nil
    end

    if root.title != data && root.left
      root = find(root.left, data)


    elsif root.title != data && root.right
      root = find(root.right, data)

    elsif root.title == data
      return root
    end

  end

  def delete(root, data)
    return nil if data == nil

    if root.title == data
      if root.left && root.right
        successor = root.right.find_min(root.right)
        root = successor
        successor.delete(successor, successor.title)
      elsif root.left
        root = root.left
      elsif root.right
        root = root.right
      else
        root.title = nil
        root.rating = nil
      end

    elsif root.title != data && root.left
      delete(root.left, data)


    elsif root.title != data && root.right
      delete(root.right, data)

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
