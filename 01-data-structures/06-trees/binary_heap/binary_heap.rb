require_relative 'node'

class BinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    insert_next(root, node)

    parent = find_parent(root, node.title)

    if node.rating < parent.rating
      swap(node, parent)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    stack = []

    stack.push(root)
    while !stack.empty? do
      current = stack.pop
      if current.title == data
        return current
        break
      else
        if current.left != nil
          stack.push(current.left)
        end
        if current.right != nil
          stack.push(current.right)
        end
      end
    end
  end

  def delete(root, data)
    if data == nil
      return
    else
      parent = find_parent(root, data)

      if (parent.left.is_a?(Node) && parent.left.title == data)
        parent.left = nil
      elsif (parent.right.is_a?(Node) &&parent.right.title == data)
        parent.right = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = []

    queue.push(@root)
    while !queue.empty? do
      current = queue.shift
      puts "#{current.title}: #{current.rating}\n"
      if current.left != nil
        queue.push(current.left)
      end
      if current.right != nil
        queue.push(current.right)
      end
    end
  end

  private
  def find_parent(root, data)
    stack = []

    stack.push(root)
    while !stack.empty? do
      current = stack.pop
      if (current.left.is_a?(Node) && current.left.title == data) || (current.right.is_a?(Node) && current.right.title == data)
        return current
        break
      else
        if current.left != nil
          stack.push(current.left)
        end
        if current.right != nil
          stack.push(current.right)
        end
      end
    end
  end

  def insert_next(root, node)
    queue = []

    queue.push root
    while !queue.empty? do
      current = queue.shift
      if current.left == nil
        current.left = node
        break
      else
        queue.push(current.left)
      end
      if current.right == nil
        current.right = node
        break
      else
        queue.push(current.right)
      end
    end
  end

  def swap(node, parent)
    temp_title = node.title
    temp_rating = node.rating
    node.title = parent.title
    node.rating = parent.rating
    parent.title =  temp_title
    parent.rating = temp_rating

    new_parent = find_parent(@root, parent.title)

    if new_parent != nil && parent.rating < new_parent.rating
      swap(parent, new_parent)
    end

  end
end
