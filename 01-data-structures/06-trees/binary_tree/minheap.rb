require_relative 'node'

class Minheap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating < root.rating #if node is less than root
      temp = root #assign root to temp var
      root = node #assign node as root
      puts "Node with value #{temp.rating} is being replaced with #{node.rating}"
      #search for correct temp var position
      #check if left leaf is empty
      if root.left === nil 
        puts root.title
        puts root.rating
        root.left = temp #assign temp to left leaf
      elsif root.right === nil
        root.right = temp
      else #left subtree
        insert(root.left, temp) #insert temp in left subtree of left leaf
      end
    elsif node.rating > root.rating
      if root.left === nil
        root.left = node
      elsif root.right === nil
        root.right = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data === nil
      return nil
    elsif root.title === data
      return root
    elsif root.title != data && root.left === nil
      if root.right === data
        return root.right
      elsif root.right === nil
        return nil
      else
        find(root.right, data)
      end
    elsif root.title != data && root.left != nil
      if root.left === data
        return root.left
      else
        find(root.left, data)
      end
    end
  end

  def delete(root, data)
    if data === nil
      return nil
    else
      node = self.find(root, data)
      if node === nil
        return nil
      else
        node.title = nil
        node.rating = nil
      end
    end
  end

  # Breadth First Search
  def printf(children=nil)
    array = [@root] 
    output = []
    while array.length > 0
      node = array.shift 
      if node.left != nil 
        array.push(node.left) 
      end
      if node.right != nil
        array.push(node.right)
      end
      output.push("#{node.title}: #{node.rating}") 
    end
    output.each {|movie| puts movie}
  end
end

