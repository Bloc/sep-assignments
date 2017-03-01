require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
    @size = 1
  end

  def insert(root, node)
    @size += 1
    current_level = (Math.log2(@size)).floor
    level_capacity = 2 ** current_level
    level_midpoint = level_capacity / 2
    tree_capacity = 2 ** (current_level + 1) - 1
    position = level_capacity - (tree_capacity - @size)

    if root.left.nil?
      root.left = node
      node.parent = root
      heapifyUp(node)
      return
    elsif root.right.nil?
      root.right = node
      node.parent = root
      heapifyUp(node)
      return
    end

    while current_level > 0
      if position <= level_midpoint
        root = root.left
        if root.left.nil?
          root.left = node
          node.parent = root
          heapifyUp(node)
          return
        elsif root.right.nil?
          root.right = node
          node.parent = root
          heapifyUp(node)
          return
        end
      elsif position > level_midpoint
        root = root.right
        if root.left.nil?
          root.left = node
          node.parent = root
          heapifyUp(node)
          return
        elsif root.right.nil?
          root.right = node
          node.parent = root
          heapifyUp(node)
          return
        end
      end

      current_level -= 1
      level_capacity = 2 ** current_level
      level_midpoint = level_capacity / 2
      if position > level_capacity
        position = position - level_capacity
      end
    end

  end

  # Recursive Depth First Search
  def find(root, data)
    if root.rating == data
      return root
    end

    if root.left != nil
      left = find(root.left, data)
      if left != nil
        return left
      end
    end

    if root.right != nil
      right = find(root.right, data)
      if right != nil
        return right
      end
    end
  end

  def delete(root, data)

    # 1. find bottom most right node (last node)
    # 2. swap last node with node being deleted
    # 3. compare replacement node with both children
    # 4. if replacement node is greater than both children, swap with smallest child
    # 5. if replacement node is less than parent, swap with parent node
    # 6. repeat until condition is not true for both cases

    if root.nil? || data.nil?
      return nil
    end

    node = find(root, data)
    if node.nil? 
      return nil
    else 
      node.title = nil
      node.rating = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]

    queue.each do |current|
      puts "#{current.title}: #{current.rating}"
      if current.left && current.right
        queue << current.left << current.right
      elsif current.left
        queue << current.left
      elsif current.right
        queue << current.right
      end
    end
  end

  def heapifyUp(node)
    if node.parent.nil?
      return nil
    end

    if node.rating < node.parent.rating
      temp = node.parent.clone
      node.parent.title = node.title
      node.parent.rating = node.rating
      node.title = temp.title
      node.rating = temp.rating
      heapifyUp(node.parent)
    end
  end

  def heapifyDown(node)
    if node.left.nil?
      return nil
    end

    if node.left && node.right
      if node.left.rating < node.rating && node.left.rating < node.right.rating
        temp = node.left.clone
        node.left.title = node.title
        node.left.rating = node.rating
        node.title = temp.title
        node.rating = temp.rating
        heapifyDown(node.left)
      elsif node.right.rating < node.rating && node.right.rating < node.left.rating
        temp = node.left.clone
        node.right.title = node.title
        node.right.rating = node.rating
        node.title = temp.title
        node.rating = temp.rating
        heapifyDown(node.right)
      end
    elsif node.left
      if node.left.rating < node.rating
        temp = node.left.clone
        node.left.title = node.title
        node.left.rating = node.rating
        node.title = temp.title
        node.rating = temp.rating
        heapifyDown(node.left)
      end
    elsif node.right
      if node.right.rating < node.rating
        temp = node.left.clone
        node.right.title = node.title
        node.right.rating = node.rating
        node.title = temp.title
        node.rating = temp.rating
        heapifyDown(node.right)
      end
    end
  end

end