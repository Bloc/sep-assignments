require_relative 'node'

class Heap
  
  def initialize
    @items = []
  end
  
  def parent_index(i)
    if i == 0
      return nil
    end
    return (i-1)/2
  end
  
  def is_left_child(i)
    return i % 2 == 1
  end
  
  def left_index(i)
    n = 2*i + 1
    if n < @items.length
      return n
    else
      return nil
    end
  end
  
  def right_index(i)
    n = 2*i + 2
    if n < @items.length
      return n
    end
    return nil
  end

  def insert(node)
    @items.push(node)
    n = @items.length -1
    set_pointers(n)
    percolate_up(n)
  end
  
  def percolate_up(n)
    if n == 0
      return
    end
    item = @items[n]
    parent = @items[parent_index(n)]
    if parent.rating < item.rating
      @items[n] = parent
      @items[parent_index(n)] = item
      set_pointers(n)
      set_pointers(parent_index(n))
      percolate_up(parent_index(n))
    end
  end

  def percolate_down(n)
    root = @items[n]
    l = left_index(n)
    r = right_index(n)
    left = @items[l]
    right = @items[r]
    if left == nil || right && left.rating < right.rating
      node = right
      index = r
    else
      node = left
      index = l
    end
    
    if node && node.rating > root.rating
      @items[index] = root
      @items[n] = node
      
      set_pointers(index)
      set_pointers(n)
      percolate_down(index)
    end
  end
      
  
  def find_index(data)
    (0...@items.length).each do |i|
      item = @items[i]
      if item.title == data
        return i
      end
    end
    return nil
  end

  # Breadth Depth First Search
  def find(data)
    i = find_index(data)
    return i && @items[i]
  end
  
  def set_pointers(i)
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
    
    
    node.left = l && @items[l]
    node.right = r && @items[r]
    
  end
  
  def delete(data)
    i = find_index(data)
    if i == nil
      return nil
    end
    root = @items[i]
    node = @items[@items.length-1]
    if node == root
      @items.delete_at(0)
      return root
    end
    @items[i] = node
    p = parent_index(i)
    parent = @items[p]
    if is_left_chid(i)
      parent.left = node
    else
      parent.right = node
    end
    @items.delete_at(@items.length-1)
    p = parent_index(@items.length-1)
    parent = @items[p]
    if is_left_chid(@items.length-1)
      parent.left = nil
    else
      parent.right = nil
    end
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
