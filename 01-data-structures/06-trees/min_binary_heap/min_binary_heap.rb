require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
    @print_queue = Queue.new
  end

  def insert(root, data)
    if data.rating < root.rating
      current_node = root.left

      if current_node
        insert(current_node, data)
      else
        root.left = data
      end
    elsif data.rating > root.rating
      current_node = root.right

      if current_node
        insert(current_node, data)
      else
        root.right = data
      end
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

  def print(root=nil)
    if root === nil
      root = @root
      puts "#{root.title}: #{root.rating}"
    end

    if root.left != nil
      @print_queue << root.left
    end

    if root.right != nil
      @print_queue << root.right
    end

    if @print_queue.empty?
      return
    else
      next_val = @print_queue.pop
      puts "#{next_val.title}: #{next_val.rating}"
      print(next_val)
    end
  end


end
