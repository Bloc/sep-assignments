require_relative 'node'
require 'thread'

class HeapSearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
    @heapsize = 1
  end

  def insert(node)
    return nil if node.nil?
    root = @root
    current = @root
    @heapsize += 1 #every insert increases heapsize; used for balancing heap

    until current.left.nil? || current.right.nil?
      if @heapsize % 2 == 0
        current = current.left
      else
        current = current.right
      end
    end

    if current.left.nil? && current.right.nil?
      current.left = node
      node.parent = current
    elsif current.left.nil? && !current.right.nil?
      current.left = node
      node.parent = current
    elsif !current.left.nil? && current.right.nil?
      current.right = node
      node.parent = current
      node.parent.left.parent = node.parent
    end

  #if rating > (greater than) its parents rating
    while node.rating >= node.parent.rating
      loop = 1
      temp_parent = node.parent
      temp_parent_right = node.parent.right
      temp_parent_left = node.parent.left
      temp_node_left = node.left
      temp_node_right = node.right
  # if node is greater then its parent and node is to the left of parent
      if node.parent.parent.nil? && node == node.parent.left
        node.right = node.parent.right
        node.parent = node.parent.parent
        node.left = temp_parent

        node.left.parent = node
        node.left.left = temp_node_left
        node.left.right = temp_node_right

        if !node.right.nil?
          node.right.parent = node
        end

        @root = node
        break
  # if node is greater then its parent and node is to the right of parent
      elsif node.parent.parent.nil? && node == node.parent.right

        node.left = node.parent.left
        node.parent = node.parent.parent
        node.right = temp_parent

        node.right.parent = node
        node.right.right = temp_node_right
        node.right.left = temp_node_left
        node.left.parent = node

        @root = node
        break


      elsif !node.parent.nil? && node == node.parent.left

        if node.parent.parent.left == node.parent
          node.parent.parent.left = node
          node.parent.parent.left.parent = node.parent.parent
          node.left = temp_parent
          node.right = temp_parent_right
          node.left.parent = node
          unless node.right.nil?
            node.right.parent = node
          end
          node.left.left = temp_node_left
          node.left.right = temp_node_right
        elsif node.parent.parent.right == node.parent
          node.parent.parent.right = node
          node.parent.parent.right.parent = node.parent.parent
          node.left = temp_parent
          node.right = temp_parent_right
          node.left.parent = node
          unless node.right.nil?
            node.right.parent = node
          end
          node.left.left = temp_node_left
          node.left.right = temp_node_right
        end

      elsif !node.parent.nil? && node == node.parent.right
        if node.parent.parent.right == node.parent
          node.parent.parent.right = node
          node.parent.parent.right.parent = node.parent.parent
          node.right = temp_parent
          node.left = temp_parent_right
          node.right.parent = node
          unless node.left.nil?
            node.left.parent = node
          end
          node.left.left = temp_node_left
          node.left.right = temp_node_right
        elsif node.parent.parent.left == node.parent
          node.parent.parent.left = node
          node.parent.parent.left.parent = node.parent.parent
          node.left = temp_parent
          node.left = temp_parent_right
          node.right.parent = node
          unless node.right.nil?
            node.right.parent = node
          end
          node.left.left = temp_node_left
          node.left.right = temp_node_right
        end

      end
    end
  end


  def delete(root, data)
    return nil if data.nil?

    node = find(root, data)

    if node.left.nil? && node.right.nil? #if both children are nil, just delete
      if node.parent.right == node
        node.parent.right = nil
      elsif node.parent.left == node
        node.parent.left = nil
      end
    elsif !node.left.nil? && node.right.nil?
      if node.parent.left == node
        node.parent.left = node.left
        node.parent.left.parent = node.parent
      elsif node.parent.right == node
        node.parent.right = node.left
        node.parent.right.parent = node.parent
      end
    elsif node.left.nil? && !node.right.nil?
      if node.parent.left == node
        node.parent.left = node.right
        node.parent.left.parent = node.parent
      elsif node.parent.right == node
        node.parent.right = node.right
        node.parent.right.parent = node.parent
      end
    elsif !node.left.nil? && !node.right.nil?
      if node.parent.left == node && node.left.rating >= node.right.rating
        node.left.parent = node.parent
        node.left.right = node.parent.right
        node.parent.left = node.left
      end


    end
  end

  def find(root, data)
    if root.title == data
      return root
    else
      left = find(root.left, data) if root.left
      right = find(root.right, data) if root.right
      left || right
    end
  end

  def print(root)
    return nil if @root.nil?
    queue = Queue.new
    queue.enq(@root)
    result = nil
    while !queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}\n" if !value.title.nil?

      # keep moving the levels in tree by pushing left and right nodes of tree in queue
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end

end
