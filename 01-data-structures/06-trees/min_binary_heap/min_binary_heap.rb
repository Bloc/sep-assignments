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
      elsif current.right.nil?
        current.right = node
      end

      while !current.nil? && node.rating < current.rating
        title = current.title
        rating = current.rating
        current.rating = node.rating
        current.title = node.title
        node.rating = rating
        node.title = title
        node = current
        current = find_parent(@root, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
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
    target = find(root, data)
    #if root.left && root.right
    last_node = find_last(@root)
    if last_node
      parent = find_parent(@root,last_node)
      #puts parent.title
      if parent.nil?
      elsif parent.left == last_node
        parent.left = nil
      else
        parent.right = nil
      end
      target.title = last_node.title
      target.rating = last_node.rating
      last_node.title = nil
      last_node.rating = nil
    end

    while target.left || target.right
      if target.left && target.right
        if target.left.rating < target.right.rating
          if target.left.rating < target.rating
            swap(target, target.left)
          else
            break
          end
        else
          if target.right.rating < target.rating
            swap(target, target.right)
          else
            break
          end
        end
      elsif target.left
        if target.left.rating < target.rating
          swap(target, target.left)
        else
          break
        end
      elsif target.right
        if target.right.rating < target.rating
          swap(target, target.right)
        else
          break
        end
      else
        break
      end
    end
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

  def find_parent(root, node)
    parent = root
    return nil if @root == node
    if parent.left == node || parent.right == node
      return parent
    end

    left = find_parent(parent.left, node) if parent.left
    right = find_parent(parent.right, node) if parent.right

    left || right

  end

  def swap(target, child)
    rating = child.rating
    title = child.title
    child.rating = target.rating
    child.title = target.title
    target.rating = rating
    target.title = title
    target = child
  end
end
