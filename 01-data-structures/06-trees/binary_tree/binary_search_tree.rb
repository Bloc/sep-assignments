require_relative 'node'

class BinarySearchTree

  attr_accessor :root, :movie_list

  def initialize(root)
    self.root = root
    self.movie_list = []
  end

  def insert(root, node)
    if node.rating > root.rating
      if root.right == nil
        root.right = node
      else 
        insert(root.right, node)
      end
    elsif node.rating < root.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.title == data
      root
    elsif root.right != nil
      find(root.right, data)
    elsif root.left != nil
      find(root.left, data)
    end
  end

  def delete(root, data)
    if !data
      nil
    else
      if root.right
        if root.right.title == data
          temp = root.right
          root.right = temp.left
          if root.right != nil
            root.right.right = temp.right
          end
        else
          delete(root.right, data)
        end
      elsif root.left
        if root.left.title == data
          temp = root.left
          root.left = temp.left
          if root.left != nil
            root.left.right = temp.right
          end
        else
          delete(root.left, data)
        end
      end
    end
  end

# nodes = []

# ####

# next_breadth = []

# nodes.each do |node|
#   print node

#   next_breadth << node.left
#   next_breadth << node.right
# end

# do_it_again(next_breadth)

  # Recursive Breadth First Search
  def printf(nodes=nil)
    next_row = []

    if nodes.nil?
      nodes = [self.root]
    end
    nodes.each do |node|
      if !node.nil?
        puts "#{node.title}: #{node.rating}"
        next_row << node.left
        next_row << node.right
      end
    end

    if next_row.count > 0
      printf(next_row)
    end
  end
end
