require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    @print_queue = Queue.new
    @delete_queue = Queue.new
  end

  def insert(root, node)
    if node.rating < root.rating
      current_node = root.left

      if current_node
        insert(current_node, node)
      else
        root.left = node
      end

    elsif node.rating > root.rating
      current_node = root.right

      if current_node
        insert(current_node, node)
      else
        root.right = node
      end

    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data.nil?
      return nil
    end

    if root.right != nil
      current_node = root.right
    elsif root.left != nil
      current_node = root.left
    end

    if current_node.title != data
      find(current_node, data)
    else
      current_node
    end
  end

  def delete(root, data)
    if data.nil?
      return nil
    else
      node_to_delete = find(root, data)
      if node_to_delete.nil?
        nil
      else
        node_to_delete.title = nil
        node_to_delete.rating = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)

    if children === nil
      children = @root
      puts "#{children.title}: #{children.rating}"
    end

    if children.left != nil
      @print_queue << children.left
    end

    if children.right != nil
      @print_queue << children.right
    end

    if @print_queue.empty?
      return
    else
      next_val = @print_queue.pop
      puts "#{next_val.title}: #{next_val.rating}"
      printf(next_val)
    end
  end
end
