require_relative 'node'

class Graph
    
    attr_accessor :nodes

    def initialize
        @nodes = []
    end
    
    def add(actor, movie)
        node = self.find(actor)
        if node == nil
            node = Node.new(actor)
            self.insert(node)
        end
        node.add_movie(movie)
        self.nodes.each do |node1|
            if node1.name != node.name
                node1.add_actor(movie, node)
            end
        end
    end
    
    def insert(node)
        @nodes.push(node) # always insert at the end of the array
        n = (@nodes.length) -1 # the index of the new node
        percolate_up(n) # if the node has a greater rating than its parent, move upward
    end
    
    def find(actor)
        return find_aux(0, actor)
    end
    
    def find_aux(index, actor)
        if index == nil
            return nil
        end
        node = self.nodes[index]
        if node == nil
            return nil
        end
        if node.name < actor
            return nil
        end
        if node.name == actor
            return node
        end
        l = left_index(index)
        r = right_index(index)
        return find_aux(l, actor) || find_aux(r, actor)
    end
    
    def root
        return @nodes[0]
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
    if n < @nodes.length
      return n
    else
      return nil
    end
  end
  
  def right_index(i) # if a node has index i, then its right child has index 2i + 2
    n = 2*i + 2
    if n < @nodes.length
      return n
    end
    return nil
  end

  def insert(node)
    @nodes.push(node) # always insert at the end of the array
    n = (@nodes.length) -1 # the index of the new node
    percolate_up(n) # if the node has a greater rating than its parent, move upward
  end
  
  def percolate_up(n) # if node number n has a greater rating than its parent, move the node up
    if n == 0 # no parent, so done
      return
    end
    item = @nodes[n] # get the node
    parent = @nodes[parent_index(n)] # get the parent
    if parent.name < item.name # if the node's name comes after the parent,
      @nodes[n] = parent # switch places with the parent
      @nodes[parent_index(n)] = item
      percolate_up(parent_index(n)) # possibly continue to percolate upward
    end
  end

  def percolate_down(n) # if node number n has lower rating than one of its children, move the node down.
    root = @nodes[n] # node number n
    l = left_index(n)
    r = right_index(n)
    left = l && @nodes[l]
    right = r && @nodes[r]
    return unless left || right # if no children, we're done
    if left == nil || right && left.name < right.name # find whether left or right has the largest name
      node = right
      index = r
    else
      node = left
      index = l
    end
    
    # now, node is the largest-named child node, and index is its index
    
    if node.name > root.name # if the child has greater name, swap
      @nodes[index] = root
      @nodes[n] = node
      
      percolate_down(index) # if necessary, keep percolating downward.
    end
  end
  
  def shift_to_place(indices, values, index, new_value)
    indices.delete(index)
    values[index] = new_value
    if indices.length == 0
      indices.push(index)
      return indices.length - 1
    end
    low = 0
    high = indices.length-1
    low_value = values[low]
    if low_value < 0  || new_value >= 0 && new_value < low_value
      indices.unshift(index)
      return 0
    end
    
    high_value = values[high]
    if new_value < 0 || high_value >= 0 && new_value > high_value
      indices.push(index)
      return high+1
    end

    middle = (low + high)/2
    value1 = values[middle]
    until low >= high || value1 == value do
      if value1 < 0 || value1 > value
        high = middle - 1
      elsif value1 < value
        low = middle + 1
      end
      middle = (low+high)/2
      value1 = values[middle]
    end
    indices.insert(middle, index)
    return middle
  end
    

    # https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
    # This function attempts to find a sequence of nodes
    # connecting the node with the start_index to the
    # node with the end_index
  def find_path(start_index, end_index)
    # Since all my nodes are numbered, we don't need a hash to associate properties
    # with nodes; we can just use an array of properties. So, for example,
    # distances[i] is the distance of node #i from the start node
    distances = [] # the distances of each node, so far
    sorted = [] # a list of indices of unvisited nodes, sorted by distance.
    
    # initially, set all distances to -1 (for "infinity")
    # and put every node into the list of unvisited nodes
    (0...self.nodes.length).each do |i|
      distances.push(-1) # undefined or infinity
      self.nodes[i].index = i # for convenience, tell each node what its index ix.
      sorted.push(i) # put each index into "sorted"
    end
    current = start_index # the starting index
    new_value = 0 # the distance value for this node
    shift_to_place(sorted, distances, current, new_value) # this puts the node's index into the right place in "sorted"
    until current == end_index do # keep going until you get to the end point
      current_node = self.nodes[current] # current node
      current_node.connected_actors().each do |actor|
        neighbor_index = actor.index
        neighbor_distance = distances[neighbor_index]
        new_value = 1 + distances[current]
        if neighbor_distance < 0 || new_value < neighbor_distance
          shift_to_place(sorted, distances, neighbor_index, new_value)
        end
      end
      sorted.delete(current) # remove it from the list of unvisited
      current = sorted[0] # find the new unvisited node with smallest distance
      if distances[current] < 0 # that means that all the remaining nodes are "infinitely far away", so give up
        return nil
      end
    end
    # at this point, we have marked all the nodes from the one at start_index
    # to the one at end_index
    retval = []
    node = self.nodes[end_index]
    retval.unshift(node)
    current_index = end_index
    until current_index == start_index do
      movie, actor = find_next(current_index, distances)
      retval.unshift(movie)
      retval.unshift(actor)
      current_index = actor.index
    end
    return retval
  end
  
  def find_next(current_index, distances)
    current_node = self.nodes[current_index]
    current_distance = distances[current_index]
    current_node.film_actor_hash.each do |movie, actors|
      actors.each do |actor|
        actor_index = actor.index
        actor_distance = distances[actor_index]
        if actor_distance >= 0 && actor_distance < current_distance
          return movie, actor 
        end
      end
    end
    return nil
  end
        

  # Recursive Breadth First Search
  def printf
    (0...@items.length).each do |i|
      item = @items[i]
      puts("#{item.title}: #{item.rating}")
    end
  end
        
        
end