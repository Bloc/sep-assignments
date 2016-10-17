require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    #insert new rating at end of heap
    if node.rating > root.rating
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    else
      if root.left.nil?
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

    #compare value of the new child node with its parent
    #swap up if needed


  def swap_up(root, node)
    #if the value of the parent node is greater than the child, then swap the parent
    #repeat compare and swap above until heap properties met
  end

  def find(root, node)

    if node == nil
      return nil
    end

    if root == nil
      return nil
    end

    if node.rating == root.rating
      root
    else
      # puts root.rating
      # puts rating
      if node.rating > root.rating
        find(root.left, node)
      # elsif rating > root.rating
      #   find(root.right, rating)
      end
    end
    #if node.rating searching for is lower than root.rating then you can exit immediately
    #if rating searching for is less than next leaf in branch stop searching that branch
  end

  def delete(root, node)
    if node == nil
      return nil
    end
    #restructure if needed
  end

  def print(root)
    queue = [@root]
    returned_string = ""

    until queue.empty?
      temp_root = queue.shift

      unless temp_root.left == nil
        queue << temp_root.left
      end
      unless temp_root.right == nil
        queue << temp_root.right
      end

      returned_string << "#{temp_root.title}: #{temp_root.rating}\n"
    end

    puts returned_string
  end

end
