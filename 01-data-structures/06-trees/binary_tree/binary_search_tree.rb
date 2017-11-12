require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    @root.left = nil
    @root.right = nil
  end

  def insert(root, node)

    @new_node = node
    @current_node = root
    @leaf_found = false

    if (node.rating < @root.rating) && (root.left.nil?)
      @root.left = @new_node
      puts "root left node set"
    elsif (node.rating >= @root.rating) && root.right.nil?
      @root.right = @new_node
      puts "root right node set"
    else
      until @leaf_found === true do
        puts "dig deeper"
        if @new_node.rating < @current_node.rating
          if @current_node.left.nil?
            @current_node.left = @new_node
            @left_found = true
          else
            @current_node = @current_node.left
          end
        else
          if @current_node.right.nil?
            @current_node.right = @new_node
            @leaf_found = true
          else
            @current_node = @current_node.right
          end
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
