require_relative 'node'

class Heap
  attr_accessor :items
  
  # Represent a tree by an array, ordered this way:
  # [root, root.left, root.right, root.left.left, root.left.right, root.right.left, root.right.right ...]
  def initialize(node)
    @items = [node]
  end
  
  def root
    return @items[0]
  end
  
  def parent_index(i) # if a node has index i, then its parent has index (i-1)/2 (rounded down)
    if i == 0
      return nil # the 0th node is the root, which has no parent
    end
    return (i-1)/2
  end
  
  def is_left_child(i) # odd-numbered nodes are left children: index 1, 3, 5, etc.
    return i % 2 == 1
  end
  
  def left_index(i) # if a node has index i, then its left child has index 2i+1
    n = 2*i + 1
    if n < @items.length
      return n
    else
      return nil
    end
  end
  
  def right_index(i) # if a node has index i, then its right child has index 2i + 2
    n = 2*i + 2
    if n < @items.length
      return n
    end
    return nil
  end

  def insert(node)
    @items.push(node) # always insert at the end of the array
    n = (@items.length) -1 # the index of the new node
    set_pointers(n) # this sets up .left and .right for the node and its parent
    percolate_up(n) # if the node has a greater rating than its parent, move upward
  end
  
  def percolate_up(n) # if node number n has a greater rating than its parent, move the node up
    if n == 0 # no parent, so done
      return
    end
    item = @items[n] # get the node
    parent = @items[parent_index(n)] # get the parent
    if parent.rating < item.rating # if the node's rating is greater than the parent,
      @items[n] = parent # switch places with the parent
      @items[parent_index(n)] = item
      set_pointers(n) # fix .left and .right for the former parent (now at index n)
      set_pointers(parent_index(n)) # and for the node (now at index parent_index(n))
      percolate_up(parent_index(n)) # possibly continue to percolate upward
    end
  end

  def percolate_down(n) # if node number n has lower rating than one of its children, move the node down.
    root = @items[n] # node number n
    l = left_index(n)
    r = right_index(n)
    left = l && @items[l]
    right = r && @items[r]
    return unless left || right # if no children, we're done
    if left == nil || right && left.rating < right.rating # find whether left or right has the highest rating
      node = right
      index = r
    else
      node = left
      index = l
    end
    
    # now, node is the highest-rated child node, and index is its index
    
    if node.rating > root.rating # if the child has greater rating, swap
      @items[index] = root
      @items[n] = node
      
      set_pointers(index) # fix pointers (.left and .right) for original parent, now at index
      set_pointers(n) # and for the child, now at n
      percolate_down(index) # if necessary, keep percolating downward.
    end
  end
  
  def find_index(data) # find the index of the node whose title is equal to data
    (0...@items.length).each do |i|
      item = @items[i]
      if item.title == data
        return i
      end
    end
    return nil
  end

  # Breadth First Search
  def find(data)
    i = find_index(data)
    return i && @items[i]
  end
  
  def set_pointers(i) # set .left and .right for node number i and its parent
    if i == nil
      return
    end
    
    node = @items[i]
    p = parent_index(i)
    l = left_index(i)
    r = right_index(i)
    if p
      parent = @items[p]
      if is_left_child(i)
        parent.left = node
      else
        parent.right = node
      end
    end
    
    return unless node

    node.left = l && @items[l]
    node.right = r && @items[r]
    
  end
  
  def delete(data) # remove the node with title == data and return that node
    i = find_index(data)
    if i == nil
      return nil # no node found
    end
    
    # first, swap the root with the last node
    root = @items[i]
    node = @items[@items.length-1]
    if node == root
      p = parent_index(i)
      @items.delete_at(i)
      set_pointers(p)
      return root
    end
    
    @items[i] = node
    set_pointers(i)
    last_index = (@items.length)-1
    @items.delete_at(last_index)
    p = parent_index(last_index)
    set_pointers(p)
    percolate_down(i)
  end

  # Recursive Breadth First Search
  def printf
    (0...@items.length).each do |i|
      item = @items[i]
      puts("#{item.title}: #{item.rating}")
    end
  end
end
