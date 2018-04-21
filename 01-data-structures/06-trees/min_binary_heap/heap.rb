require_relative 'node'
require 'benchmark'

class Heap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    placed = nil
    if root == @root
      children = [root]
    else
      children = root
    end
    nextRow = []
    children.each do |child|
      # if not empty, add left child to search queue
      if child.left == nil
        child.left = node
        node.parent = child
        placed = node
      # if not emptry, add right child to search queue
      elsif child.right == nil
        child.right = node
        node.parent = child
        placed = node
      else
        nextRow.push(child.left)
        nextRow.push(child.right)
      end
      if placed
        break
      end
    end
    if placed != nil
      order(placed)
    else
      insert(nextRow, node)
    end
  end

  def order(node)
    if node != @root
      if node.rating < node.parent.rating
        # node's grandparent
        g = node.parent.parent if node.parent.parent != nil
        # node's parent
        d = node.parent
        # node's children
        l = node.left
        r = node.right

        # temp var o if node's parent has another child
        if d.left == node
          o = node.parent.right
        else
          o = node.parent.left
        end
        if o != nil
          # connect node to node's parent's other child
          if d.left == node
            node.right = o
          else
            node.left = o
          end
          # connect node's parent's other child to node
          o.parent = node
        end
        # reconnect node to node's parent
        if d.left == node
          node.left = d
        else
          node.right = d
        end
        # reconnect node's parent to node
        d.parent = node
        # connect node's children to new parent
        l.parent = d if l != nil
        r.parent = d if r != nil
        # connect node's parent to new children
        d.left = l
        d.right = r
        # connect node's grandparent to node
        if g != nil && g.left == d
          g.left = node
        end
        if g != nil && g.right == d
          g.right = node
        end
        # connect node to node's grandparent
        if g == nil
          @root = node
        end
        node.parent = g

        order(node)
      end
    end
  end

  # Recursive Depth First Search
  def find(node, target)
    if node == nil
      return nil
    elsif node.title == target
      return node
    else
      x = find(node.right, target)
      y = find(node.left, target)
      if x != nil
        return x
      elsif y != nil
        return y
      else
        return nil
      end
    end
  end

  def delete(root, data)
    found = find(root, data)
    return nil if found == nil
    replacement = grab_last()
    if replacement != found
      # remove relationship to old parent for replacement node
      if replacement.parent.right == replacement
        replacement.parent.right = nil
      end
      if replacement.parent.left == replacement
        replacement.parent.left = nil
      end
      # connect replacement node to found's parent
      if found.parent != nil
        replacement.parent = found.parent
        # connect found's parent to replacement
        if found.parent.left == found
          found.parent.left = replacement
        else
          found.parent.right = replacement
        end
      else
        replacement.parent = nil
        @root = replacement
      end
      replacement.left = found.left
      replacement.right = found.right
      found.left.parent = replacement if !found.left.nil?
      found.right.parent = replacement if !found.right.nil?
      order(replacement)
      if (!replacement.left.nil? && replacement.rating > replacement.left.rating) || (!replacement.right.nil? && replacement.rating > replacement.right.rating)
        lower(replacement)
      end
    else
      if found.parent.left == found
        found.parent.left = nil
      else
        found.parent.right = nil
      end
      found = nil
    end
  end

  def lower(node)
    unless node.left.nil?
      if node.right.nil? || node.left.rating < node.right.rating
        swap = node.left
        swap.left.parent = node if !swap.left.nil?
        node.left = swap.left
        swap.left = node
        swap.right.parent = node if !swap.right.nil?
        temp = node.right
        node.right = swap.right
        swap.right = temp
        temp.parent = swap
      else
        swap = node.right
        temp = node.left
        swap.left.parent = node
        swap.right.parent = node
        node.right = swap.right
        node.left.parent = swap
        node.left = swap.left
        swap.left = temp
        swap.right = node
      end

      unless node.parent.nil?
        if node.parent.left == node
          node.parent.left = swap
        else
          node.parent.right = swap
        end
      else
        @root = swap
      end
      swap.parent = node.parent
      node.parent = swap

      if (!node.left.nil? && node.rating > node.left.rating) || (!node.right.nil? && node.rating > node.right.rating)
        lower(node)
      end
    end
  end


  def grab_last(children=nil)
    if children == nil
      children = [@root]
    end
    nextRow = []
    children.each do |child|
      nextRow.push(child.left) if child.left != nil
      nextRow.push(child.right) if child.right != nil
    end
    if nextRow.size == 0
      return children[-1]
    else
      grab_last(nextRow)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children == nil
      if @root
        children = [@root]
      else
        return nil
      end
    end
    nextRow = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      nextRow.push(child.left) if child.left != nil
      nextRow.push(child.right) if child.right != nil
    end
    if nextRow.size == 0
      return nil
    else
      printf(nextRow)
    end
  end
end
=begin
root = Node.new(1, 1)
n = 2
tree = Heap.new(root)
puts Benchmark.measure {
    while n <= 10000
        tree.insert(root, Node.new(n, n))
        n += 1
    end
}
puts Benchmark.measure {
    tree.printf
} 
=end