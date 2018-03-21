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
    movie = find(root, data)
    movie.title = nil
    movie.rating = nil
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
