class Heap
  def initialize(root)
    @list = Array.new(2, 0)
    @root = root
    @list[1] = @root
  end
  
  def insert(root, node)
    @list.push(node)
    node_index = @list.index(node)
    
    if node_index % 2 == 1
      parent_index = (node_index - 1) / 2
    elsif node_index % 2 == 0
      parent_index = (node_index) / 2
    end
    
    while @list[parent_index].rating < node.rating
      temp = @list[parent_index]
      @list[parent_index] = node
      @list[node_index] = temp
      
      node_index = parent_index
      if parent_index % 2 == 0
        parent_index = parent_index / 2
      else
        parent_index = (parent_index - 1) / 2
      end
    end
  end
  
  def delete(root, node)
    node_index = @list.index(node)
    @list[node_index] = @list.pop
    replaced_node = @list[node_index]
    replaced_node_index = node_index
    
    left_child_index = node_index * 2
    right_child_index = node_index * 2 + 1
    
    while @list[left_child_index] || @list[right_child_index]
      if @list[right_child_index].nil? && @list[left_child_index]
        if @list[left_child_index].rating > replaced_node.rating
          temp = @list[right_child_index]
          @list[right_child_index] = replaced_node
          @list[node_index] = temp
        end
      else
        if @list[left_child_index].rating > @list[right_child_index].rating
          temp = @list[left_child_index]
          @list[left_child_index] = replaced_node
          @list[replaced_node_index] = temp
          replaced_node_index = left_child_index
          left_child_index = left_child_index * 2
          right_child_index = right_child_index * 2 + 1
        else
          temp = @list[right_child_index]
          @list[right_child_index] = replaced_node
          @list[replaced_node_index] = temp
          replaced_node_index = right_child_index
          left_child_index = left_child_index * 2
          right_child_index = right_child_index * 2 + 1
        end
      end
    end
    
    if root == node
      @root = @list[1]
    end
  end
  
  def find(root, node)
    queue = Array.new
    root = @root
    queue.push(root)
    if node.nil?
      return nil
    else
      target = node
    end
    
    node_index = 1
    left_child_index = node_index * 2
    right_child_index = node_index * 2 + 1
    
    while !queue.empty?
      node_to_examine = queue.shift
      if node_to_examine == target
        return node_to_examine
      end
      
      puts left_child_index
      puts right_child_index
      
      if @list[left_child_index]
        queue.push(@list[left_child_index])
        left_child_index = left_child_index * 2
      end
      if @list[right_child_index]
        queue.push(@list[right_child_index])
        right_child_index = right_child_index * 2 + 1
      end
    end
  end
  
  def print(node)
    if node.nil?
      return nil
    end
    target_node = find(@root, node)
    puts "#{target_node.title}: #{target_node.rating}"
  end
end
