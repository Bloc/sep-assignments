require_relative 'node'

class MinBinaryHeap
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating > root.rating
      if root.left.nil?
        node.parent = root
        root.left = node
      elsif root.right.nil?
        node.parent = root
        root.right = node
      else
        if root.left.left.nil? || root.left.right.nil?
          insert(root.left, node)
        elsif root.right.left.nil? || root.right.right.nil?
          insert(root.right, node)
        end
      end
    elsif node.rating < root.rating && root == @root
      @root = node
      node = root
      insert(@root, node)
    elsif node.rating < root.rating && root != @root
      temp_root = root
      if root.parent.left == root
        root.parent.left = node
      elsif root.parent.right == root
        root.parent.right = node
      end
      insert(node, temp_root)
    end
  end

  # Recursive Depth First Search
  def find(root, rating)
    if root == nil
      return nil
    end
    if rating == root.rating
      return root
    else
      if rating < root.rating
        find(root.left, rating)
      elsif rating > root.rating
        find(root.right, rating)
      else
        root = root.parent
        find(root, rating)
      end
    end
  end

  def delete(root, data)
    return nil if data == nil
    node = find(root, data)
    parent = node.parent
    largest_node = find_max_value(root)
    if parent.left == node
      node = largest_node
    elsif parent.right == node
      node = largest_node
    end
    if node > node.left
      swap_nodes(node, node.left)
    elsif node > node.right
      swap_nodes(node, node.right)
    end
  end

  def find_max_value(root)
    max = nil
    largest_node = nil
    if root.left != nil || root.right != nil
      if root.left.rating > max
        max = root.left.rating
        largest_node = root
        root = root.left
        find_max_value(root)
      elsif root.right.rating > max
        max = root.right.rating
        largest_node = root
        root = root.right
        find_max_value(root)
      end
    end
    return largest_node
  end

  def swap_nodes(node, child_node)
    if node > child_node
      temp = node
      node = child_node
      child_node = temp
    end
  end

  # Recursive Breadth First Search
  def printf
    queue = []
    output = [@root]
    if @root.left != nil
      queue.push(@root.left)
    end
    if @root.right != nil
      queue.push(@root.right)
    end
    queue.each do |q|
      output.push(q)
      if q.left != nil
        queue.push(q.left)
      end
      if q.right != nil
        queue.push(q.right)
      end
    end
    output.each do |o|
      puts "#{o.title}: #{o.rating}"
    end
  end
end


jumanji = Node.new("Jumanji: Welcome to the Jungle", 76)
mazerunner = Node.new("Maze Runner: The Death Cure", 43)
winchester = Node.new("Winchester", 10)
showman = Node.new("The Greatest Showman", 55)
post = Node.new("The Post", 88)
hostiles = Node.new("Hostiles", 72)
strong = Node.new("12 Strong", 54)
thieves = Node.new("Den of Thieves", 39)
water = Node.new("The Shape of Water", 92)
paddington = Node.new("Paddington 2", 100)

movies = MinBinaryHeap.new(jumanji)

movies.insert(movies.root, strong)
movies.insert(movies.root, water)
movies.insert(movies.root, paddington)
movies.insert(movies.root, mazerunner)
movies.insert(movies.root, winchester)
movies.insert(movies.root, showman)
movies.insert(movies.root, post)
movies.insert(movies.root, hostiles)
movies.insert(movies.root, thieves)

movies.printf
