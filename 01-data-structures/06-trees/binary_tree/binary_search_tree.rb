require_relative 'node'
require "benchmark"

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    #if the root node rating is greater than node rating, empty left child
    if root.rating > node.rating && root.left == nil
      root.left = node
      root.left.parent = root
    #if the root node rating is greater than node rating, occupied left child
    elsif root.rating > node.rating && root.left != nil
      root = root.left
      insert(root, node)
    #if the root node rating is lower than node rating, empty right child
    elsif root.rating < node.rating && root.right == nil
      root.right = node
      root.right.parent = root
      #if the root node rating is lower than node rating, occupied right child
    elsif root.rating < node.rating && root.right != nil
      root = root.right
      insert(root, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    # if data is nil
    if data == nil
      return nil
    end

    if root.title == data
      return root
    end

    found_node = nil

    unless root.left.nil?
      found_node = find(root.left, data)
    end

    unless found_node || root.right.nil?
      found_node = find(root.right, data)
    end
    #What happens when we encounter a leaf node, without siblings, at the very left of the tree?

    return found_node
  end

  #Delete a node
  def delete(root, data)
    if data == nil
      return nil
    else
      node = find(root, data)

      #The node has no children
      if (node.right == nil) && (node.left == nil)
        node.title = nil
        node.rating = nil
        node.parent = nil
      end
        #The node has a left child only
      if (node.left != nil) && (node.right == nil)
        left_node = node.left
        # if the node to be removed is a left child
        if node.parent.left == node
          node.parent.left = left_node
          left_node.parent = node.parent

          node.title = nil
          node.rating = nil
          node.left = nil
          node.right = nil
          node.parent = nil
        else
          node.parent.right = left_node
          left_node.parent = node.parent

          node.title = nil
          node.rating = nil
          node.left = nil
          node.right = nil
          node.parent = nil
        end
      end
      #The node has a right child only
      if (node.left == nil) && (node.right != nil)
        right_node = node.right
        # if the node to be removed is itself a left child
        if node.parent.left == node
          node.parent.left = right_node
          right_node.parent = node.parent

          node.title = nil
          node.rating = nil
          node.left = nil
          node.right = nil
          node.parent = nil
        else
          node.parent.right = right_node
          right_node.parent = node.parent

          node.title = nil
          node.rating = nil
          node.left = nil
          node.right = nil
          node.parent = nil
        end
      end
      #The node has both a right and left child
      if (node.left != nil) && (node.right != nil)
        right_node = node.right
        left_node = node.left

        #smallest element in the right subtree
        smallest_node = node.right
        while smallest_node.left != nil
          smallest_node = smallest_node.left
        end

        # if the node to be removed is a left child
        if node.parent.left == node
          node.parent.left = smallest_node
          if smallest_node.right # if smallest_node has a right node/family
            insert(smallest_node.parent, smallest_node.right)
          end
          smallest_node.right = right_node
          smallest_node.left = left_node
          smallest_node.parent = node.parent

          node.title = nil
          node.rating = nil
          node.left = nil
          node.right = nil
          node.parent = nil
        else #if the node to be removed is itself a right child
          node.parent.right = smallest_node
          if smallest_node.right
            insert(smallest_node.parent, smallest_node.right)
          end
          smallest_node.right = right_node
          smallest_node.left = left_node
          smallest_node.parent = node.parent

          node.title = nil
          node.rating = nil
          node.left = nil
          node.right = nil
          node.parent = nil
        end
      end
    end
  end

  # Recursive Breadth First Search
  def printf()
    #node object array
    children = []

    #info array
    arr = []
    arr.push("#{@root.title}: #{@root.rating}")
    if @root.left != nil
      children.push(@root.left)
    end
    if @root.right != nil
      children.push(@root.right)
    end

    # adds nodes to children array AND pushes data to arr
    children.each do |node|
      if node.left != nil
        children.push(node.left)
      end
      if node.right != nil
        children.push(node.right)
      end
      arr.push("#{node.title}: #{node.rating}")
    end

    puts arr
  end
end

basketball = Node.new("Love and Basketball", 10)
sniper = Node.new("American Sniper", 20)
out = Node.new("In and Out", 30)
matrix =Node.new("The Matrix", 40)
rings = Node.new("Lord of the Rings", 50)
jam = Node.new("Space Jam", 60)
dance =Node.new("Save the last Dance", 70)
day = Node.new("Training Day", 80)
best = Node.new("The Best Man", 90)
love = Node.new("Love Jones", 99)

binaryTree = BinarySearchTree.new(basketball)

  binaryTree.insert(basketball, sniper)
  binaryTree.insert(basketball, out)
  binaryTree.insert(basketball, matrix)
  binaryTree.insert(basketball,rings)
  binaryTree.insert(basketball, jam )
  binaryTree.insert(basketball, dance)
  binaryTree.insert(basketball, day)
  binaryTree.insert(basketball, best)
  binaryTree.insert(basketball, love )

  binaryTree.printf

  "======================"

  array_of_numbers = (2..100000).to_a.shuffle
  array_of_nodes = []

  root_node = Node.new("Root Node", 49000 )
  bst_tree = BinarySearchTree.new(root_node)

  array_of_numbers.each do |i|
    array_of_nodes.push(Node.new("Title #{i}", i))
  end

  Benchmark.bm(7) do |x|
    x.report("insert") do
      array_of_nodes.each do |n|
      bst_tree.insert(root_node, n)
      end
    end

    x.report("find") do
      bst_tree.find(root_node, "Title 5")
    end

    x.report("delete") do
      bst_tree.delete(root_node, "Title 50000")
    end
  end

  # bst_tree.printf
