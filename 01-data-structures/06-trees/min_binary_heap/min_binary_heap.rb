require_relative 'node'

class MinBinaryHeap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    return nil if node.nil?

    if @root.nil?
      @root = node
    else

      queue = Queue.new
      queue.enq(@root)

      #find empty spot of min heap
      while !queue.empty?
        current = queue.deq

        if current.left && current.right
          queue.enq(current.left)
          queue.enq(current.right)
        else
          break
        end
      end

      #insert node to left or right child
      if current.left.nil?
        current.left = node
        node.parent = current
      elsif current.right.nil?
        current.right = node
        node.parent = current
      end

      # puts "#{current.title} & #{current.parent.title}" if current.parent
      while !current.nil? && node.rating < current.rating
        if current == @root
          @root = node
        end

        #current = current.parent
        #puts temp_node.title
        if current.left == node
          replace_child_parent(node, current)
          temp_right = node.right

          node.right = current.right
          node.right.parent = node if node.right
          current.right = temp_right
          current.left = node.left
          node.left = current
          current.parent = node
          current.right.parent = current if current.right
          current.left.parent = current if current.left
          #puts "#{temp_node.title} & #{temp_node.parent.title}" if temp_node.parent
        elsif current.right == node
          replace_child_parent(node, current)
          temp_left = node.left
          node.left = current.left
          node.left.parent = node if node.left
          current.left = temp_left
          current.right = node.right
          node.right = current
          current.parent = node
          current.right.parent = current if current.right
          current.left.parent = current if current.left
        end
        current = node.parent
      end
      #puts @root.title
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    puts root.title
    return nil if data.nil?

    return root if root.title == data
    left = find(root.left, data) if root.left


    if left
      return left
    else
      right = find(root.right, data) if root.right
      return right if right
    end
  end

  def delete(root, data)
    return nil if data == nil
    target = find(root, "Pacific Rim")

    #if root.left && root.right
    last_node = find_last(target)

    if last_node
      if target.parent
        last_node.parent = target.parent
        if last_node.parent.left == target
          last_node.parent.left = last_node
        elsif last_node.parent.right == target
          last_node.parent.right = last_node
        end
      end

      last_node.left = target.left
      last_node.right = target.right
      target.left.parent = target if target.left
      target.right.parent = target if target.right
      target.title = nil
      target.rating = nil
      target.left = nil
      target.right = nil
      target.parent = nil
    end
      #root = successor
      #successor.delete(successor, successor.title)
    # #elsif root.left
    #   root = root.left
    # elsif root.right
    #   root = root.right
    # else
    #   root.title = nil
    #   root.rating = nil
    # end
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

  def find_last(root)
    queue = Queue.new
    queue.enq(root)

    while queue.size != 0
      node = queue.deq
      queue.enq(node.left) if node.left
      queue.enq(node.right) if node.right
    end
    node
  end

  def replace_child_parent(node, node_to_replace)
    node_to_replace.parent ? node.parent = node_to_replace.parent : node.parent = nil
    if node.parent.nil?
    elsif node.parent.left == node_to_replace
      node.parent.left = node
    else
      node.parent.right = node
    end
  end
end
