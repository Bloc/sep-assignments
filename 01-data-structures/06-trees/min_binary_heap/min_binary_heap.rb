require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, data)
    if data.rating < root.rating

      if current_node
        insert(current_node, node)
      else
        root.left = node
      end

    # elsif node.rating > root.rating
    #   current_node = root.right
    #
    #   if current_node
    #     insert(current_node, node)
    #   else
    #     root.right = node
    #   end

    end
  end

  def delete(root, data)
  end

  def find(root, data)
  end

  def print(root)
  end


end
