require_relative 'node'

class MinHeapTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    root = @root
    queue = Queue.new
    queue.enq(root)
    while !queue.empty?
      value = queue.deq
      if !value.left
        value.left = node
        node.parent = value
        break
      elsif !value.right
        value.right = node
        node.parent = value
        break
      else
        queue.enq(value.left)
        queue.enq(value.right)
      end
    end
    sift_up(node)
  end

  def sift_up(node)
    while node.parent && node.parent.rating > node.rating

      if node === node.parent.left
        # if the node has children, they become the parent's children
        node.parent.right ? temp_right = node.parent.right : temp_right = nil
        node.right ? node.parent.right = node.right : node.parent.right = nil
        node.left ? node.parent.left = node.left : node.parent.left = nil
        # the node then inherits the parent's other child and the parent becomes a child
        node.right = temp_right
        node.left = node.parent
        # then the parent's parent becomes the nodes parent if it has one
        temp_parent = node.parent
        if node.parent.parent
          #determine which child the parent is relative to its parent and set the node
          #to that
          if node.parent.parent.left && node.parent.parent.left === temp_parent
            node.parent.parent.left = node
            node.parent = node.parent.parent
          else
            node.parent.parent.right = node
            node.parent = node.parent.parent
          end
        else
          node.parent = nil
        end
        # finally the node becomes its parent's parent
        temp_parent.parent = node
        puts "#{node.title} has been swapped. It's parent is #{node.parent.title} and its children are #{node.left ? node.left.title : 'no left child'} and #{node.right ? node.right.title : 'no right child'}"
      else
        # if the node has children, they become the parent's children
        temp_left = node.parent.left
        node.right ? node.parent.right = node.right : node.parent.right = nil
        node.left ? node.parent.left = node.left : node.parent.left = nil
        # the node then inherits the parent's other child and the parent becomes a child
        node.right = node.parent
        node.left = temp_left
        # then the parent's parent becomes the nodes parent if it has one
        temp_parent = node.parent
        if node.parent.parent
          #determine which child the parent is relative to its parent and set the node
          #to that
          if node.parent.parent.left && node.parent.parent.left === temp_parent
            node.parent.parent.left = node
            node.parent = node.parent.parent
          else
            node.parent.parent.right = node
            node.parent = node.parent.parent
          end
        else
          node.parent = nil
        end
        # finally the node becomes its parent's parent
        temp_parent.parent = node
        puts "#{node.title} has been swapped. It's parent is #{node.parent.title} and its children are #{node.left ? node.left.title : 'no left child'} and #{node.right ? node.right.title : 'no right child'}"
      end
    end
  end

  def find(root, data)
    return nil if !root || data === nil
    return root if root.title === data
    if root.left && root.left.title === data
      return root.left
    elsif root.right && root.right.title === data
      return root.right
    elsif find(root.left, data)
      return find(root.left, data)
    elsif find(root.right, data)
      return find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if data === nil
    if root.left && root.left.title === data
      root.left = nil
    elsif root.right && root.right.title === data
      root.right = nil
    elsif find(root.left, data)
      delete(root.left, data)
    elsif find(root.right, data)
      delete(root.right, data)
    end
  end

  def printf
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}"
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end

end
