require_relative 'node'

class BinarySearchTree

  def initialize(root)
    self.root = root

  end

  def insert(root, node)
    if root.rating < node.rating
      (root.right.nil?) ? root.right = node : insert(root.right, node)
    else
      (root.left.nil?) ? root.left = node : insert(root.left, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if  data.nil?

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
    remove = find(root, data)
    remove.title, remove.rating = nil, nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [root] #FIFO
    children = []

    until queue.empty?
      sub_root = queue.slice!(0)

      queue << sub_root.left if !sub_root.left.nil?
      queue << sub_root.right if !sub_root.right.nil?

      children << "#{sub_root.title : sub_root.rating}"
    end

    children.each do |child|
      puts child
    end
  end

end

root = Node.new("The Great Debaters", 79)
swat = Node.new("S.W.A.T.", 48)
equalizer = Node.new("The Equalizer", 60)
out = Node.new("Get Out", 99)
ride1 = Node.new("Ride Along", 19)
ride2 = Node.new("Ride Along 2", 14)
think = Node.new("Think Like A Man", 79)
think2 = Node.new("Think Like A Man Too", 53)
love = Node.new("Love And Basketball", 82)
last = Node.new("Transformers: The Last Knight", 15)
moon = Node.new("Transformers: Dark Of The Moon", 35)
trans = Node.new("Transformers", 57)

tree = BinarySearchTree.new(root)

tree.insert(root, swat)
tree.insert(root, equalizer)
tree.insert(root, out)
tree.insert(root, ride1)
tree.insert(root, ride2)
tree.insert(root, think)
tree.insert(root, think2)
tree.insert(root, love)
tree.insert(root, last)
tree.insert(root, moon)
tree.insert(root, trans)

tree.printf
