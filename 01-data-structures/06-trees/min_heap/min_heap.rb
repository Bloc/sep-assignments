require_relative 'node'

class MinHeapTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.nil?
      root = node
    elsif root.left.nil?
      root.left = node
      swap(root, node) if root.rating > node.rating
    elsif root.right.nil?
      root.right = node
      swap(root, node) if root.rating > node.rating
    elsif min_height(root.left) <= min_height(root.right)
      insert(root.left, node)
      swap(root, root.left) if root.rating > root.left.rating
    else
      insert(root.right, node)
      swap(root, root.right) if root.rating > root.right.rating
    end
  end

  def swap(node1, node2)
    temp_node = Node.new(node1.title, node1.rating)
    temp_node.left = node2.left
    temp_node.right = node2.right
    if node1 == @root
      @root = node2
    else
      parent = find_parent(@root, node1)
      if parent.left.title == node1.title
        parent.left = node2
      else
        parent.right = node2
      end
    end
    if node1.left.title == node2.title
      node2.left = node1
      node2.right = node1.right
    else
      node2.right = node1
      node2.left = node1.left
    end
    node1.left = temp_node.left
    node1.right = temp_node.right
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil? || root.nil?
    if root.title == data
      return root
    else
      node = find(root.left, data)
      if node.nil?
        node = find(root.right, data)
      end
    end
    return node
  end

  def find_parent(root, node)
    return nil if root.nil?
    if !root.left.nil? 
      if root.left.title == node.title
        return root
      else
        lparent = find_parent(root.left, node)
        return lparent unless lparent.nil?
      end
    end
    if !root.right.nil? 
      if root.right.title == node.title
        return root
      else
        rparent = find_parent(root.right, node)
        return rparent unless rparent.nil?
      end
    end
  end

  def delete(root, data)
    return nil if root.nil? || data.nil?
    node_to_delete = find(root, data)
    return nil if node_to_delete.nil?
    find_last_node(@root, tree_height(@root))
    replace(node_to_delete, @last_node)  
    sink_down(@last_node)
  end

  def make_child(node)
    node.left = nil
    node.right = nil
  end

  def replace(node1, node2)
    if node1 == @root && node2 == @root
      @root = nil
      make_child(node2)
      make_child(node1)
    elsif node1 == @root
      node2.left = node1.left
      node2.right = node1.right
      @root = node2
      if root.left.title == node2.title
        root.left = nil
      else
        root.right = nil
      end
      make_child(node1)
    else
      parent = find_parent(@root, node1)
      parent2 = find_parent(@root, node2)
      if node1 == node2
        if parent.left.title == node1.title
          parent.left = nil
        else
          parent.right = nil
        end
        make_child(node2)
        make_child(node1)
      else
        if parent.left.title == node1.title
          parent.left = node2
        else
          parent.right = node2
        end
        node2.left = node1.left
        node2.right = node1.right
        make_child(node1)
      end
      if parent != parent2
        if parent2.left.title == node2.title
          parent2.left = nil
        else
          parent2.right = nil
        end
      end
    end
  end

  def sink_down(node)
    if !node.right.nil?
      if node.rating > node.right.rating
        swap(node, node.right)
        sink_down(node)
      end
    end
    if !node.left.nil?
      if node.rating > node.left.rating
        swap(node, node.left)
        sink_down(node)
      end
    end
  end

  def tree_height(root)
    if root.nil?
      return 0
    else
      lheight = tree_height(root.left)
      rheight = tree_height(root.right)

      if lheight > rheight
        return lheight + 1
      else
        return rheight + 1
      end
    end
  end

  def min_height(root)
    if root.nil?
      return 0
    else
      return min_height(root.right) + 1
    end
  end

  def find_last_node(node, level)
    if @root.nil?
      @last_node = nil
    elsif node.nil?
      return
    elsif level == 1
      @last_node = node
    else
      find_last_node(node.left, level-1)
      find_last_node(node.right, level-1)
    end
  end   

  def last_node
    find_last_node(@root, tree_height(@root))
    return @last_node
  end

  def print_given_level(node, level)
    if node.nil?
      return
    elsif level == 1
      puts "#{node.title}: #{node.rating}"
    else
      print_given_level(node.left, level-1)
      print_given_level(node.right, level-1)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    theight = tree_height(@root)
    for i in 1..theight do
      print_given_level(@root, i)
    end
  end
end
