require_relative 'node'

class MinBinaryHeap
  attr_reader :root

  def initialize(root)
    @root = root
  end

def insert(root, node)

  if root.rating > node.rating
    temp = root
    @root = node
    node = temp
    insert(@root, node)
  else
    if root.left.nil?
      root.left = node
    elsif root.right.nil? && !root.left.nil?
      root.right = node
    elsif !root.left.nil? && !root.right.nil? && !root.left.left.nil? && !root.left.right.nil?
      insert(root.right, node)
    elsif !root.left .nil? && !root.right.nil?
      insert(root.left, node)
    end
  end
end

  def find(root, data)
    if data.nil?
      return nil
    else
      if root.title.eql?(data)
        return root
      elsif !root.left.nil?
        find(root.left, data)
      elsif !root.right.nil?
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if  data.nil?
      return nil
    else
      target = find(root, data)
      target.nil? ? nil : (target.title.nil? && target.rating.nil?)
    end
  end

  def printf
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

binaryHeap = MinBinaryHeap.new(ray)

binaryHeap.insert(ray, ali)
binaryHeap.insert(ray, unbreakable)
binaryHeap.insert(ray, american)
binaryHeap.insert(ray, kong)
binaryHeap.insert(ray, think)
binaryHeap.insert(ray, mib)
binaryHeap.insert(ray, debaters)
binaryHeap.insert(ray, reloaded)
binaryHeap.insert(ray, matrix)
binaryHeap.insert(ray, wood)
binaryHeap.insert(ray, revolt)

binaryHeap.printf
