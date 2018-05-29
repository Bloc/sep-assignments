class MinHeap
  def initialize(root)
    @list = Array.new(2, nil)
    @root = root
    @list[1] = @root
  end
  
  def insert(root, node)
    @list.push(node)
    node_index = @list.length - 1
    
    if node_index % 2 == 1
      parent_index = (node_index - 1) / 2
    elsif node_index % 2 == 0
      parent_index = (node_index) / 2
    end
    
    while parent_index > 0 && @list[parent_index] >= node
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
    if @list[@list.length - 1] == node
      @list.pop
    else
      @list[node_index] = @list.pop
    end
    
    while @list[node_index * 2]
      if @list[node_index * 2] && @list[node_index * 2 + 1]
        if @list[node_index] < @list[node_index * 2] || @list[node_index] < @list[node_index * 2 + 1]
          if @list[node_index * 2] <= @list[node_index * 2 + 1]
            temp = @list[node_index * 2 + 1]
            @list[node_index * 2 + 1] = @list[node_index]
            @list[node_index] = temp
            node_index = node_index * 2 + 1
          else
            temp = @list[node_index * 2]
            @list[node_index * 2] = @list[node_index]
            @list[node_index] = temp
            node_index = node_index * 2
          end
        end
      elsif @list[node_index * 2] && !@list[node_index * 2 + 1]
        if @list[node_index * 2] < @list[node_index]
          temp = @list[node_index * 2]
          @list[node_index * 2] = @list[node_index]
          @list[node_index] = temp
        end
      end
    end
    
    
    if root == node
      @root = @list[1]
    end
  end
  
  def find(node)
    queue = Array.new
    root = @root
    queue.push(root)
    if node.nil?
      return nil
    else
      target = node
    end
    
    node_index = 1
    
    while !queue.empty?
      node_to_examine = queue.shift
      if node_to_examine == target
        return node_to_examine
      end
      
      queue.push(node_index * 2) if @list[node_index * 2]
      queue.push(node_index * 2 + 1) if @list[node_index * 2 + 1]
      node_index += 1
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
