class MinHeap
  def initialize(root)
    @list = Array.new(2, nil)
    @root = root
    @list[1] = @root
  end
  
  def min_value
    return @list[1]
  end
  
  def insert(node)
    @list.push(node)
    node_index = @list.length - 1
    perc_up(node_index)
    
    @root = @list[1]
  end
  
  def delete(node)
    if @list.index(node)
      node_index = @list.index(node)
    else
      puts "No such item"
      return false
    end
    
    if @list[@list.length - 1] == node
      return @list.pop
    else
      replacement = @list.pop
      @list[node_index] = replacement
    end
    
    if has_parent?(node_index) && @list[parent_index_of(node_index)] >= @list[node_index]
      perc_up(node_index)
    else
      perc_down(node_index)
    end
    
    @root = @list[1]
  end
  
  def perc_up(node_index)
    while has_parent?(node_index) && @list[parent_index_of(node_index)] >= @list[node_index]
      swap(parent_index_of(node_index), node_index)
      node_index = parent_index_of(node_index)
    end
  end
  
  def perc_down(node_index)
    while has_smaller_child?(node_index)
      puts "element is #{@list[node_index]}"
      if @list[node_index * 2 + 1] && @list[node_index * 2 + 1] < @list[node_index * 2]
        swap(node_index, node_index * 2 + 1)
        node_index = node_index * 2 + 1
      elsif @list[node_index * 2] < @list[node_index]
        swap(node_index, node_index * 2)
        node_index = node_index *= 2
      else
        true
      end
    end
  end
  
  def has_smaller_child?(index)
    if @list[index * 2] && @list[index * 2 + 1]
      if @list[index] > @list[index * 2] || @list[index] > @list[index * 2 + 1]
        return true
      else
        return false
      end
    elsif @list[index * 2] && !@list[index * 2 + 1]
      if @list[index] > @list[index * 2]
        return true
      end
    else
      return false
    end
  end
  
  def has_parent?(index)
    if index == 0 || index == 1
      return false
    else
      return true
    end
  end
  
  
  
  def parent_index_of(index)
    if index % 2 == 1
      parent_index = (index - 1) / 2
    elsif index % 2 == 0
      parent_index = (index) / 2
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
  
  def swap(index, index2)
    temp = @list[index2]
    @list[index2] = @list[index]
    @list[index] = temp
  end
end
