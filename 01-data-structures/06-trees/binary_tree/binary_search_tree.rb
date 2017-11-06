require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  # uses depth first search to find the appropriate place to add the data and adds it as a new Leaf.
  def insert(root, node)
    if root.rating > node.rating
      root.left.nil? ? root.left = node : insert(root.left, node)
    else
      root.right.nil? ? root.right = node : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil?
      if root.title.eql?(data)
        return root
      elsif !root.left.nil?
        find(root.left, data)
      elsif !root.right.nil?
        find(root.right, data)
      end
  end

  def delete(root, data)
    return nil if data.nil?

      target = find(root, data)
      target.nil? ? nil : (target.title = nil && target.rating = nil)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    q = [@root]
    output = []
    while q.length > 0
      new_root = q.shift
      if !new_root.left.nil?
        q.push(new_root.left)
      end
      if !new_root.right.nil?
        q.push(new_root.right)
      end
      output.push("#{new_root.title}: #{new_root.rating}")
    end
    output.each {|x| print x + "\s"}
  end
end


ray = Node.new("Ray", 81)
ali = Node.new("Ali", 67)
unbreakable = Node.new("Unbreakable", 68)
american = Node.new("American Gangster", 80)
kong = Node.new("Kong: Skull Island", 76)
think = Node.new("Think Like A Man", 53)
mib = Node.new("Men In Black", 93)
debaters = Node.new("The Great Debaters", 79)
reloaded = Node.new("The Matrix Reloaded", 73)
matrix = Node.new("The Matrix", 87)
wood = Node.new("The Wood", 62)
revolt = Node.new("The Matrix Revolutions", 36)

bstree = BinarySearchTree.new(ray)

bstree.insert(ray, ali)
bstree.insert(ray, unbreakable)
bstree.insert(ray, american)
bstree.insert(ray, kong)
bstree.insert(ray, think)
bstree.insert(ray, mib)
bstree.insert(ray, debaters)
bstree.insert(ray, reloaded)
bstree.insert(ray, matrix)
bstree.insert(ray, wood)
bstree.insert(ray, revolt)

bstree.printf
