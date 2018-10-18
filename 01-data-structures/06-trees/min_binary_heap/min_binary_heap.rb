require_relative 'node'

class MinBinaryHeap

  attr_accessor :root

  def initialize(root)
    @root = root
    @print_queue = Queue.new
  end

  def insert(root, data)
    if data.rating < root.rating
      puts "jeool"
      temp = root
      root = data
      insert(data, temp)

    elsif data.rating > root.rating

      if root.left == nil
        root.left = data
      elsif root.right == nil
        root.right = data
      elsif root.left.left == nil || root.left.right == nil
        insert(root.left, data)
      elsif root.right.right == nil || root.right.left == nil
        insert(root.right, data)
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
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
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
