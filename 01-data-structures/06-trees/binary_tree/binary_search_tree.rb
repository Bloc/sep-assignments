require_relative 'node'

class BinarySearchTree

  attr_accessor :root, :movie_list, :favorite_movies

  def initialize(root)
    self.root = root
    self.movie_list = []

    self.favorite_movies = [
      Node.new("John Wick", 85),
      Node.new("Dune (1984)", 57),
      Node.new("Irreversible", 58),
      Node.new("Skyfall", 93),
      Node.new("Casino Royale", 95),
      Node.new("Aliens", 98),
      Node.new("The Godfather", 99),
      Node.new("The Social Network", 96),
      Node.new("Moon", 89),
      Node.new("Ex Machina", 93),
      Node.new("Event Horizon", 24),
      Node.new("Starship Troopers", 63),
      Node.new("Robocop (1987)", 88),
      Node.new("Total Recall", 56),
      Node.new("Fight Club", 80),
      Node.new("Pulp Fiction", 91),
      Node.new("Melancholia", 79),
      Node.new("Nymphomaniac: Volume I", 75),
      Node.new("Nymphomaniac: Volume II", 60),
      Node.new("The Fifth Element", 71),
      Node.new("Out For Justice", 19),
      Node.new("Star Wars: The Empire Strikes Back", 94),
      Node.new("Star Wars: A New Hope", 93),
      Node.new("Valhalla Rising", 70),
      Node.new("Hammer of the Gods", 30),
    ]
  end

  def insert(root, node)
    if root.nil?
      self.root = node
    elsif node.rating > root.rating
      if root.right == nil
        root.right = node
      else 
        insert(root.right, node)
      end
    elsif node.rating < root.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.title == data
      root
    elsif root.right != nil
      find(root.right, data)
    elsif root.left != nil
      find(root.left, data)
    end
  end

  def delete(root, data)
    if !data
      nil
    else
      if root.right
        if root.right.title == data
          temp = root.right
          root.right = temp.left
          if root.right != nil
            root.right.right = temp.right
          end
        else
          delete(root.right, data)
        end
      elsif root.left
        if root.left.title == data
          temp = root.left
          root.left = temp.left
          if root.left != nil
            root.left.right = temp.right
          end
        else
          delete(root.left, data)
        end
      end
    end
  end

# nodes = []

# ####

# next_breadth = []

# nodes.each do |node|
#   print node

#   next_breadth << node.left
#   next_breadth << node.right
# end

# do_it_again(next_breadth)

  # Recursive Breadth First Search
  def printf(nodes=nil)
    next_row = []

    if nodes.nil?
      nodes = [self.root]
    end

    nodes.each do |node|
      if !node.nil?
        puts "#{node.title}: #{node.rating}"
        next_row << node.left
        next_row << node.right
      end
    end

    if next_row.count > 0
      printf(next_row)
    end
  end

  def create_movie_tree
    insert(nil, self.favorite_movies[0])

    self.favorite_movies.each do |movie|
      self.insert(self.root, movie)
    end
  end

  # node.title search
  def recursive_breadth_find(nodes=nil, data)
    next_row = []

    if nodes.nil?
      nodes = [self.root]
    end

    nodes.each do |node|
      if !node.nil?
        if node.title == data
          return node
        else
          next_row << node.left
          next_row << node.right
        end
      end
    end

    if next_row.count > 0
      recursive_breadth_find(next_row)
    end
  end

end
