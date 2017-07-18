require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def root
    @root
  end

  def insert(root = @root, node)
    parent = root
    while true
      if node.rating < parent.rating
        parent.left ? parent = parent.left : (node.up = parent; parent.left = node; return)
      else
        parent.right ? parent = parent.right : (node.up = parent; parent.right = node; return)
      end
    end
  end

  # Recursive Depth First Search
  def find(root = @root, data)
    finder = @root
    while finder.title != data
      self.find(nil) if data && data == @root.looking_for
      if finder.left && finder.left.looking_for != data
        finder = finder.left
        finder.looking_for = data
      elsif finder.right && finder.right.looking_for != data
        finder = finder.right
        finder.looking_for = data
      elsif finder.up
        finder = finder.up
      else
        return nil
      end
    end
    # puts finder.title
    finder
  end

  def delete(root = @root, data)
    return nil if data == nil
    target = find(data)
    if target.left
      target.up.left = target.left
      target.left.up = target.up
    end
  end

  # Recursive Breadth First Search
  def printf(gen = 10)
    for k in 0..gen do
      duds = 0
      (2**k).times do |i|
        cell = ''
        for j in 0...k
          i[j] == 1 ? cell = '.right' + cell : cell = '.left' + cell
        end
        cell = '@root' + cell
        begin
          cell = eval cell
          puts cell.title + ': ' + cell.rating.to_s
          # gen += 1
        rescue
        duds += 1
        return if duds == 2**gen
        end
      end
    end
  end
end
