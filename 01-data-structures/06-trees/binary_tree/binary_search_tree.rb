require_relative 'node'
require_relative '../../02-stacks-and-queues/myqueue/myqueue.rb'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating >= root.rating && root.right
      insert(root.right, node)
    elsif node.rating >= root.rating && !root.right
      root.right = node
    elsif node.rating <= root.rating && root.left
      insert(root.left, node)
    elsif node.rating <= root.rating && !root.left
      root.left = node
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data.nil?
      return nil
    end
    
    if root.nil?
      return nil
    elsif root.title == data
      return root
    else
      find(root.right, data) ||
      find(root.left, data)
    end
  end
  
  def delete(root, data)
    if data.nil?
      return nil
    end
    
    item = find(root, data)
    if (root.left && root.left.title == item.title) || (root.right && root.right.title == item.title)
      if item.right.nil? && item.left.nil?
        item.rating > root.rating ? root.right = nil : root.left = nil
      elsif item.rating > root.rating
        if item.left && item.right.nil?
          root.right = item.left
        elsif item.left.nil? && item.right
          root.right = item.right
        else
          current_node = item.left
          while current_node.right
            parent = current_node
            current_node = current_node.right
          end
          root.right = current_node
          delete(parent, current_node)
        end
      end
    elsif item.rating >= root.rating
      delete(root.right, item.title)
    else
      delete(root.left, item.title)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = Array.new
    root = @root
    queue.push(root)
    
    while !queue.empty?
      movie = queue.shift
      puts "#{movie.title}: #{movie.rating}"
      if movie.left
        queue.push(movie.left)
      end
      if movie.right
        queue.push(movie.right)
      end
    end
  end
end
